'''
Publishes a transform for Vicon tracking data
over ROS.

This is largely not used, but keeping it here just in case.

By Jasper Harvey
'''


# ROS node to publish odometry message on /vicon/odom
import socket
import struct 
import csv
import signal
import rospy
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from geometry_msgs.msg import Point, Pose, Quaternion, Twist, Vector3
import tf 


def start_node():
    localPort = 51001 # Port that Vicon spits data out on.
    localIP = "0.0.0.0"
    bufferSize  = 1024
    # Create a datagram socket
    UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
    # Bind to address and ip
    UDPServerSocket.bind((localIP, localPort))


    # Setup ROS node
    trans = tf.TransformBroadcaster()
    rospy.init_node('viconTransform')
    rate = rospy.Rate(100) # Try 100Hz

    while not rospy.is_shutdown():
        current_time = rospy.Time.now()
        bytesAddressPair = UDPServerSocket.recv(1024)
        x = struct.unpack('d', bytesAddressPair[32:40])[0]
        y = struct.unpack('d', bytesAddressPair[40:48])[0]
        z = struct.unpack('d', bytesAddressPair[48:56])[0]
        Rx = struct.unpack('d', bytesAddressPair[56:64])[0]
        Ry = struct.unpack('d', bytesAddressPair[64:72])[0]
        Rz = struct.unpack('d', bytesAddressPair[72:80])[0]

        q = quaternion_from_euler(Rx,Ry,Rz)

        trans.sendTransform((x,y,z), q, current_time, "vicon", "world")
        vicontf = str([x,y,z,Rx,Ry,Rz])

        rospy.loginfo(vicontf) # prints to sceen, logs the information etc.
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