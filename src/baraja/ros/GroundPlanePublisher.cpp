/**
 * Publishes shape_msgs/Plane messages to topic "" with detected ground plane values
 *
 * # Representation of a plane, using the plane equation ax + by + cz + d = 0
 * # a := coef[0]
 * # b := coef[1]
 * # c := coef[2]
 * # d := coef[3]
 *
 * float64[4] coef
 */

#include "ros/ros.h"
#include "shape_msgs/Plane.h"

#include "baraja/ground_plane/GroundPlaneEstimator.cpp"



int main(int argc, char ** argv)
{
	ros::init(arg, argv, "ground_plane_pub_node");

	/* or nh = getNodeHandle(); */
	ros::NodeHandle nh;

	// advertise() returns a Publisher object to publish messages on that topic by publish()
	ros::Publisher ground_plane_pub = nh.advertise<shape_msgs::Plane>("ground_plane_topic", 1);

	// ros::Rate loop_rate(10);
	ros::Rate rate(10); // 10 Hz

	while (ros::ok())
	{
		shape_msgs::Plane plane_msg;

		plane_msg.coef = [0,1,2,3]; // placeholder

		ROS_INFO(plane_msg->coef); //

		ground_plane_pub.publish(plane_msg);

		// if we were to add a subscription and did not have ros::spinOnce() here, our callbacks would never get called
		ros::spinOnce();

		rate.sleep();
	}

	return 0;
}