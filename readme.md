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

4. Start RTABmap. Should work like normal. If you get lots of errors relating to the time of transforms, or timestamps not being set, you have done something wrong (most likely use_sim_time not set to true). 
    ```
    . setup.bash
    roslaunch launch_lidar_rgb_mapping.launch IMU:=true/false odom:=0/1/11
    ```


- The helper scripts can be located in /FYP_ws/python_helper_scripts/

- You will need to "pip install PyQt5" to use the LiDAR monitor.  


# Installation:
All installation instructions assume you are using [Ubuntu 18.04](https://releases.ubuntu.com/18.04/)

#### ROS
- Run ```sudo apt-get update``` to update package index.
- Install ROS Melodic. Instructions [here](http://wiki.ros.org/melodic/Installation/Ubuntu). It is recommended to do ros-melodic-desktop-full to ensure ease of use. 
- Install **ros-melodic-ddynamic-reconfigure** is installed:
    ```
    sudo apt-get update
    sudo apt-get install ros-melodic-ddynamic-reconfigure
    ```
- Install OpenCV 3.2.0
    ```
    cd 
    sudo apt-get install cmake
    sudo apt-get install gcc g++
    sudo apt-get install python3-dev python3-numpy
    sudo apt-get install libavcodec-dev \
    libavformat-dev libswscale-dev
    sudo apt-get install libgstreamer-plugins-base1.0-dev \
    libgstreamer1.0-dev
    sudo apt-get install libgtk2.0-dev
    sudo apt-get install libpng-dev
    sudo apt-get install libjpeg-dev
    sudo apt-get install libopenexr-dev
    sudo apt-get install libtiff-dev
    sudo apt-get install libwebp-dev
    sudo apt-get install git
    
    mkdir ~/opencv_build && cd ~/opencv_build
    git clone https://github.com/opencv/opencv.git
    git clone https://github.com/opencv/opencv_contrib.git
    cd ~/opencv_build/opencv
    git checkout 3.2.0
    cd ../opencv_contrib
    git checkout 3.2.0
    cd ~/opencv_build/opencv
    mkdir build && cd build
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D ENABLE_PRECOMPILED_HEADERS=OFF \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
    -D BUILD_EXAMPLES=ON ..
    make -j8
    sudo make install
    ```
- Make sure OpenCV version is correct
    ```
    pkg-config --modversion opencv
    ```
    Should see 3.2.0
- Install RTABmap from source. It is important to install RTABmap from source, as it makes life a lot easier to manage the package and modify the source if needed. This is basically following source install instructions from [here](https://github.com/introlab/rtabmap_ros/tree/melodic-devel). Install optional dependencies.
    ```shell
        sudo apt install ros-melodic-libg2o
        sudo apt install ros-melodic-rtabmap
        \ ros-melodic-rtabmap-ros
        sudo apt remove ros-melodic-rtabmap
        \ ros-melodic-rtabmap-ros
        # Add PPA
        sudo add-apt-repository ppa:borglab/gtsam-release-4.0
        sudo apt update  # not necessary since Bionic
        # Install:
        sudo apt install libgtsam-dev libgtsam-unstable-dev
        # Libpointmatcher
        ros-melodic-libpointmatcher

        cd ~
        git clone https://github.com/introlab/rtabmap.git rtabmap
        cd rtabmap/build
        cmake ..
        make -j6
        sudo make install

    ```

Install Lucid Vision Labs SDK:

1. Get [SDK](https://thinklucid.com/downloads-hub/) 
2. Extract the SDK to home directory (~/)
```shell
	tar -xvf ArenaSDK_v0.1.26_Linux_x64.tar.gz -C ~
```
3. Setup:
```shell
	cd ~/ArenaSDK_Linux_x64/
	sudo sh Arena_SDK_Linux_x64.conf
```

4. Add environment variable
```shell
	echo "export ARENA_ROOT=~/ArenaSDK_Linux_x64" >> ~/.bashrc
	source ~/.bashrc
```

5. Confirm the environment variable has been set
```shell
	echo $ARENA_ROOT
```

That *should* get the SDK setup. Pretty sure its all pre-compiled so nothing to do there. 


Now ROS, RTABmap and OpenCV should be installed. Clone this repo:

```
cd
mkdir FYP_ws
cd FYP_ws
git clone https://github.com/Jasper-Harvey/FYP_ws.git
```

You will need to copy extra camera messages used by the Lucid Vision Labs driver:

```
cd FYP_ws
sudo cp /opt/ros/melodic/include/sensor_msgs/image_encodings.h /opt/ros/melodic/include/sensor_msgs/image_encodings.h.bak 

sudo cp inc/image_encodings.h /opt/ros/melodic/include/sensor_msgs/image_encodings.h
```



A few other packages that you might need to install to get RTABmap_ros to compile:
```
sudo apt install ros-melodic-geographic-msgs ros-melodic-geographic-info
sudo apt install libgeographic-dev
sudo apt install libcpprest-dev
```


The workspace should now be setup, now build it:
```
cd FYP_ws 
catkin_make
```


If you are having issues, the ROS workspace can be reconstructed from scatch by installing
- rtabmap_ros [git](https://github.com/introlab/rtabmap_ros/tree/melodic-devel)
- robot_localizaiton [git](https://github.com/cra-ros-pkg/robot_localization/tree/melodic-devel)
- baraja (the baraja LIDAR ros driver). You'll have to contact them for the driver source code.
- an-driver [git](https://github.com/advanced-navigation/ros1-driver)
- arena-camera [git](https://github.com/lucidvisionlabs/arena_camera_ros)

Then just use the launch files contained in this repo. 
The camera calibration files and settings are stored in /src/arena-camera/config

