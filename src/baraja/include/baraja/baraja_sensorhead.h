#ifndef BARAJA_SENSORHEAD_H
#define BARAJA_SENSORHEAD_H

#include <stdint.h>

#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>

#include <baraja/bpc_packet.h>

namespace baraja
{

class BarajaSensorhead
{
public:
    BarajaSensorhead();
    ~BarajaSensorhead();

    void set(ros::NodeHandle pnh, const std::string & frame_id);

    void add(const BPC_Point & p, float x, float y, float z);
    void publish(bool force_publish);

private:
    void init_pointcloud2(sensor_msgs::PointCloud2 & pc, size_t size, std::string frame_id);
    void publish_pointcloud2();

    int32_t diff_angle(int32_t a, int32_t b) const;

    bool initialized_;

    ros::NodeHandle pnh_;
    std::string frame_id_;
    sensor_msgs::PointCloud2 pointcloud_fill_msg_;
    ros::Publisher pointcloud_pub_;

    uint32_t seq_id_;

    int32_t last_theta_;
    bool end_of_cycle_;
};

}

#endif
