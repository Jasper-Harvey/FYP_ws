# Final Year Project ROS workspace

## What is located here:
This is the ROS workspace used to perform real time SLAM using a Baraja Spectrum LiDAR, a Lucid Vision Triton camera and Advanced Navigation Spatial unit.

In addition to the ROS packages needed to run SLAM, a few helper tools are also included:

- Python scripts to recieve Vicon tracking data and publish over a ROS odomety topic. 

- A small tool for monitoring and changing the run/idle state of the Baraja LiDAR

## Usage:

To run the SLAM solution in real time, run in separate terminals (open terminal in the root directory of the workspace):

1. Start ROS core
    ```shell
    roscore
    ```
2. Launch the drivers to pull data from the sensors (optional parameters IMU and NTRIP for IMU and GPS correction messages):
    ```
    . setup.bash
    roslaunch launch_sensors.launch IMU:=true/false NTRIP:=true/false
    ```
3. Start RTABmap after all the sensor drivers have successfully started. Optional argumens: "IMU" to use EKF on IMU and ICP data. "odom" 0,1 or 11 to use Frame-To-Map, Frame-To-Frame, or F-LOAM 
    ```
    . setup.bash
    roslaunch launch_lidar_rgb_mapping.launch IMU:=true/false odom:=0/1/11
    ```

To run SLAM on some pre-recorded data from a bag file do:
1. Start ROS core
    ```
    roscore
    ```

2. Set required parameters and launch the offline transforms:
    ```
    rosparam set use_sim_time true
    roslaunch sensorTransforms.launch
    ```
3. Open bags and start publishing required data:
    ```
    rosbag play bagfile --topics \
    /camera_arena_node/camera_info \
    /camera_arena_node/image_rect \
    /baraja_lidar_1/sensorhead_11 \
    /an_device/Imu \
    --clock --pause
    ```


The helper scripts can be located in /FYP_ws/python_helper_scripts/

You will need to "pip install PyQt5" to use the LiDAR monitor.  


## Installation:
- Install ROS Melodic


## Pretty pictures:


