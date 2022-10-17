#include <baraja/baraja_lidar.h>

#include <ros/console.h>
#include <pluginlib/class_list_macros.h>

#include <iostream>

#include <baraja/bpc_packet.h>
#include <baraja/RawUdp.h>

const int MAX_BPC_POINTS = 1000;

// Register this nodelet
PLUGINLIB_EXPORT_CLASS(baraja::BarajaLidar, nodelet::Nodelet)

void publish_thread(baraja::BarajaLidar* lidar, const float constant_publish_rate)
{
    ros::Rate rate(constant_publish_rate);

    while (true)
    {
        // Trigger publishing of lidar data at given rate.
        rate.sleep();
        lidar->publish();
    }
}

void baraja::BarajaLidar::onInit()
{
    pnh_ = getPrivateNodeHandle();

    std::string frame;
    pnh_.param("frame", frame, std::string("lidar"));

    pnh_.param("engine_ip", engine_ip_, std::string("192.168.9.10"));

    float constant_publish_rate;
    pnh_.param("constant_publish_rate", constant_publish_rate, 10.0F);

    // Initialize
    for (int i = 0; i < MAXIMUM_SENSORHEADS; i++)
    {
        sensorhead_[i].set(pnh_, frame + std::to_string(i));
    }

    services_.set(pnh_, engine_ip_);

    udp_batch_sub_ = getNodeHandle().subscribe("baraja_udp_batched", 1000, &baraja::BarajaLidar::handle_raw_udp_array, this);
    
    // Support single udp messages for backwards compatibility with older unbatched rosbag recordings / listeners.
    udp_sub_ = getNodeHandle().subscribe("baraja_udp", 1000, &baraja::BarajaLidar::handle_raw_udp, this);
    

    std::string publish_mode;
    pnh_.param("publish_mode", publish_mode, std::string("frame"));

    // If the publish mode is set to constant, start the constant rate publishing thread.
    if (publish_mode == "constant")
    {
        self_publish_flag_ = false;
        publish_rate_thread_ = boost::shared_ptr<std::thread>
            (new std::thread(publish_thread, this, constant_publish_rate));
    }
    else
    {
        self_publish_flag_ = true;
    }

    NODELET_INFO_STREAM("Finished init BarajaLidar");
}

// ROS synchronization step
void baraja::BarajaLidar::publish()
{
    publish_flag_ = true;
}


void baraja::BarajaLidar::handle_raw_udp_array(const baraja::RawUdpArray::ConstPtr& msg)
{
    for (const baraja::RawUdp& it : msg->packets)
    {
        handle_udp_msg(it);
    }
}


void baraja::BarajaLidar::handle_raw_udp(const baraja::RawUdp::ConstPtr& msg)
{
    handle_udp_msg(*msg);
}

void baraja::BarajaLidar::handle_udp_msg(const baraja::RawUdp& msg)
{
    if (msg.engine_ip == engine_ip_)
    {
        packet_number_++;

        const uint8_t* recv_buffer_ = (uint8_t*) msg.udp_buffer.data();
        const std::size_t bytes_transferred = msg.udp_buffer.size();

        // check header content.
        const uint8_t version = bpc_get_format_version(recv_buffer_, bytes_transferred);
        if (version == 255)
        {
            return;
        }

        const uint32_t expected_length = bpc_get_expected_length(recv_buffer_, bytes_transferred);
        assert(bytes_transferred == expected_length);
        const uint32_t num_points = bpc_get_num_points(recv_buffer_, bytes_transferred);

        BPC_Header header;
        bpc_fill_header(recv_buffer_, bytes_transferred, &header);

        BPC_Point points[MAX_BPC_POINTS];
        bpc_fill_points(recv_buffer_, bytes_transferred, points, MAX_BPC_POINTS);

        // Add points from packet to buffer
        for (int i = 0; i < header.point_count; i++)
        {
            BPC_Point point = points[i];

            if (point.distance > 1000000)
            {
                continue;
            }

            // observe ROS coordinate frames
            point.theta -= 900000;

            const float pt[3] = { point.distance * cosf(point.phi * M_PI / (180.0f * 10000)) * cosf(point.theta * M_PI / (180.0f * 10000)) / 1000.0f,
                point.distance * cosf(point.phi * M_PI / (180.0f * 10000)) * sinf(point.theta * M_PI / (180.0f * 10000)) / 1000.0f,
                point.distance * sinf(point.phi * M_PI / (180.0f * 10000)) / 1000.0f };

            const float x = (float)pt[0];
            const float y = (float)pt[1];
            const float z = (float)pt[2];

            sensorhead_[point.sensorhead].add(point, x, y, z);

            if (self_publish_flag_)
            {
                sensorhead_[point.sensorhead].publish(false);
            }
        }

        if (publish_flag_)
        {
            for (int i = 0; i < MAXIMUM_SENSORHEADS; i++)
            {
                sensorhead_[i].publish(true);
            }
            publish_flag_ = false;
        }
    }

}
