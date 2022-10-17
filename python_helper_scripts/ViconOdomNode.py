'''
This script creates a node to publish tracking data from a 
Vicon camera system as a ROS odometry message.

Assumes vicon is publishing data over a UDP stream.

By Jasper Harvey
'''


# ROS node to publish odometry message on /vicon/odom
import socket
import struct 
import csv
import signal

from matplotlib import offsetbox
import rospy
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from geometry_msgs.msg import Point, Pose, Quaternion, Twist, Vector3
import tf 
import time


def start_node():
    # Setup ROS node
    pub = rospy.Publisher("vicon/odom", Odometry, queue_size=100)
    node = rospy.init_node('viconData')
    rate = rospy.Rate(100) # Try 100Hz

    localPort = 51001 # Port that Vicon spits data out on.
    localIP = "0.0.0.0"
    bufferSize  = 1024
    # Create a datagram socket
    UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
    # Bind to address and ip
    UDPServerSocket.bind((localIP, localPort))

    # My attempt at getting velocity measurements:
    t = tf.TransformListener()
    time.sleep(3)
    seq = 0
    while not rospy.is_shutdown():

        current_time = rospy.Time()
        bytesAddressPair = UDPServerSocket.recv(1024)
        x = struct.unpack('d', bytesAddressPair[32:40])[0]
        y = struct.unpack('d', bytesAddressPair[40:48])[0]
        z = struct.unpack('d', bytesAddressPair[48:56])[0]
        Rx = struct.unpack('d', bytesAddressPair[56:64])[0]
        Ry = struct.unpack('d', bytesAddressPair[64:72])[0]
        Rz = struct.unpack('d', bytesAddressPair[72:80])[0]
        # t.waitForTransform('vicon', 'world', rospy.Time(), rospy.Duration(1))
        # (linear, angular) = t.lookupTwist('vicon','world', current_time, rospy.Duration(0.1)) # The frame names are definitely wrong
        # pt,rot = t.lookupTransform('vicon', 'world', current_time)
        
        odomMsg = Odometry()
        odomMsg.header.seq = seq
        seq = 1 + seq
        odomMsg.header.stamp = rospy.Time.now()
        odomMsg.header.frame_id = "viconOdometry" # Header frame is kinda like the world frame? or Map frame
        # Position
        odomMsg.pose.pose.position = Point(float(x), float(y), float(z))
        q = quaternion_from_euler(Rx,Ry,Rz)

        odomMsg.pose.pose.orientation = Quaternion(q[0],q[1],q[2],q[3])
        # odomMsg.pose.pose = Pose(pt, rot)

        # Velocity
        # Might need to come up with a nice way to determine the velocity? KF maybe
        # Not sure how noisy this can be without messing it up...
        odomMsg.child_frame_id = "base" # Not sure what to do here possibly "sensorhead_11" if using Baraja
                                            # I think the child frame is the one that moves
        odomMsg.twist.twist = Twist(Vector3(0,0,0), Vector3(0,0,0))

        if seq % 100 == 0:
            rospy.loginfo(odomMsg) # prints to sceen, logs the information etc.
        pub.publish(odomMsg)
        rate.sleep()

def handler(signum, frame):
    msg = "Ctrl-c was pressed. Saving data."
    print(msg)

    exit()


if __name__ == '__main__':

    signal.signal(signal.SIGINT, handler)
    try:
        start_node()
    except rospy.ROSInterruptException:
        pass