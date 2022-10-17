#ifndef BARAJA_LIDAR_H
#define BARAJA_LIDAR_H

#include <ros/ros.h>
#include <nodelet/nodelet.h>
#include <sensor_msgs/PointCloud2.h>

#include <string>
#include <thread>

#include <baraja/baraja_sensorhead.h>
#include <baraja/baraja_services.h>
#include <baraja/bpc_packet.h>
#include <baraja/RawUdp.h>
#include <baraja/RawUdpArray.h>

const int MAXIMUM_SENSORHEADS = 16;

namespace baraja
{
#define DEF_EXCEPTION(name, parent) \
    class name  : public parent { \
        public: \
                name(const char* msg) : parent(msg) {} \
    }\

    DEF_EXCEPTION(Exception, std::runtime_error);

    DEF_EXCEPTION(TimeoutException, Exception);

    DEF_EXCEPTION(BadDataException, Exception);
#undef DEF_EXCEPTION

class BarajaLidar : public nodelet::Nodelet
{
public:
    void onInit();

    void publish();

    uint64_t get_packet_count() const { return packet_number_; }

private:
    void handle_raw_udp_array(const baraja::RawUdpArray::ConstPtr& msg);
    void handle_raw_udp(const baraja::RawUdp::ConstPtr& msg);

    void handle_udp_msg(const baraja::RawUdp& msg);

    ros::NodeHandle pnh_;  
    ros::Subscriber udp_sub_;
    ros::Subscriber udp_batch_sub_;

    boost::shared_ptr<std::thread> publish_rate_thread_;
    boost::shared_ptr<std::thread> spin_thread_;

    std::string engine_ip_;
    BarajaSensorhead sensorhead_[MAXIMUM_SENSORHEADS];
    BarajaServices services_;

    bool publish_flag_;
    bool self_publish_flag_;

    uint64_t packet_number_;
};

}

#endif
