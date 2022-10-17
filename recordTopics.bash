rosbag record -O ~/BagData/outside5  \
/baraja_lidar_1/sensorhead_11 \
/camera_arena_node/image_rect \
/camera_arena_node/camera_info \
/tf /tf_static \
/an_device/odom \
/an_device/Imu \
/an_device/NavSatFix \
--split --size 5000
