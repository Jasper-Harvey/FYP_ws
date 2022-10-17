#include <baraja/baraja_sensorhead.h>

#include <chrono>

#include <baraja/bpc_packet.h>

const int THETA_JUMP_THRESHOLD = 300000;
const int THETA_PER_REVOLUTION = 3600000;
const int MIN_POINTS_PER_POINTCLOUD = 1000;
const int PC2_NUM_FIELDS = 5;

using namespace baraja;

BarajaSensorhead::BarajaSensorhead()
    : initialized_(false)
    , end_of_cycle_(false)
    , seq_id_(0)
    , last_theta_(0)
{
}

BarajaSensorhead::~BarajaSensorhead()
{
}

void BarajaSensorhead::set(ros::NodeHandle pnh, const std::string& frame_id)
{
    pnh_ = pnh;
    frame_id_ = frame_id;
}

int32_t BarajaSensorhead::diff_angle(int32_t a, int32_t b) const
{
    int32_t diff_theta = a - b;

    if (diff_theta > THETA_PER_REVOLUTION)
    {
        diff_theta -= THETA_PER_REVOLUTION;
    }
    else if (diff_theta < -THETA_PER_REVOLUTION)
    {
        diff_theta += THETA_PER_REVOLUTION;
    }

    return diff_theta;
}

void BarajaSensorhead::init_pointcloud2(sensor_msgs::PointCloud2& pc, size_t size, std::string frame_id)
{
    pc.header.frame_id = frame_id;
    pc.width = size;
    pc.height = 1;

    pc.fields.resize(PC2_NUM_FIELDS);
    pc.fields[0].name = "x";
    pc.fields[1].name = "y";
    pc.fields[2].name = "z";
    pc.fields[3].name = "intensity";
    pc.fields[4].name = "time";
    int offset = 0;

    // For xyzi, All offsets are *4, as all field data types are float32 or uint32
    for (size_t d = 0; d < pc.fields.size(); ++d, offset += 4)
    {
        pc.fields[d].offset = offset;
        pc.fields[d].datatype = sensor_msgs::PointField::FLOAT32;
        pc.fields[d].count = 1;
    }

    // Timestamp is a uint32.
    pc.fields[4].datatype = sensor_msgs::PointField::UINT32;

    pc.point_step = offset;
    pc.row_step = pc.point_step * pc.width;

    pc.data.resize(size * pc.point_step);
    pc.is_bigendian = false;
    pc.is_dense = false;
}

// Swap buffers and publish pointcloud message
void BarajaSensorhead::publish_pointcloud2()
{
    if (!initialized_)
    {
        // Initialise messages and buffers
        pointcloud_pub_ = pnh_.advertise<sensor_msgs::PointCloud2>(frame_id_, 1);

        init_pointcloud2(pointcloud_fill_msg_, 0, frame_id_);

        initialized_ = true;
    }

    // Set size related parameters in message correctly
    const int pointcloud2_point_size = PC2_NUM_FIELDS * sizeof(float);
    const size_t nbytes = pointcloud_fill_msg_.data.size();
    pointcloud_fill_msg_.width = nbytes / pointcloud2_point_size;
    pointcloud_fill_msg_.row_step = nbytes;

    // TODO find a better way to timestamp, using engine timestamp
    const int64_t ns = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch()).count();
    pointcloud_fill_msg_.header.stamp = ros::Time(ns / 1.0e9);
    pointcloud_fill_msg_.header.seq = seq_id_++;

    pointcloud_pub_.publish(pointcloud_fill_msg_);

    // Clear fill buffer
    pointcloud_fill_msg_.data.resize(0);
}

// Point receive callback
void BarajaSensorhead::add(const BPC_Point& p, float x, float y, float z)
{
    // Insert data into pointcloud
    const float intensity = (float)p.intensity;
    const float timestamp = reinterpret_cast<const float&>(p.time);
    const float point_data[] = { x, y, z, intensity, timestamp };
    const uint8_t* point_data_bytes = reinterpret_cast<const uint8_t*>(point_data);
    pointcloud_fill_msg_.data.insert(std::end(pointcloud_fill_msg_.data), point_data_bytes, point_data_bytes + sizeof(point_data));

    if (abs(diff_angle(last_theta_, p.theta)) > THETA_JUMP_THRESHOLD)
    {
        end_of_cycle_ = true;
    }
    last_theta_ = p.theta;
}

void BarajaSensorhead::publish(bool force_publish)
{
    // Publish when we have a complete scan, or when asked
    if (force_publish && !pointcloud_fill_msg_.data.empty())
    {
        publish_pointcloud2();
    }
    else if (end_of_cycle_)
    {
        // Only publish reasonably sized point clouds.
        if (pointcloud_fill_msg_.data.size() > MIN_POINTS_PER_POINTCLOUD)
        {
            publish_pointcloud2();
        }
        end_of_cycle_ = false;
    }
}
