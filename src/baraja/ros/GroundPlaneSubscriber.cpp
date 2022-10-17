#include "ros/ros.h"
#include "shape_msgs/Plane.h"


// Gets called when a new message arrives on "ground_plane_topic"
// The message is passed in a boost shared_ptr, which means you can store it off if you want, without worrying about it getting deleted underneath you, and without copying the underlying data
void groundPlaneCallback(const shape_msgs::Plane::ConstPtr& plane_msg)
{
	ROS_INFO(plane_msg->coef);
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "ground_plane_sub_node");

	ros::NodeHandle nh;

	// queue size, in case we are not able to process messages fast enough. In this case, if the queue reaches 1 message, we will start throwing away old messages as new ones arrive
	// There are versions of the NodeHandle::subscribe() function which allow you to specify a class member function, or even anything callable by a Boost.Function object
	ros::Subscriber ground_plane_sub = nh.subscribe("ground_plane_topic", 1, groundPlaneCallback);

	// ros::spin() will enter a loop, pumping callbacks as messages arrive
	
	ros::spin();

	return 0;
}