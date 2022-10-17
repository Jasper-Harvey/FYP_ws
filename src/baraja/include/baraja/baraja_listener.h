#ifndef BARAJA_LISTENER_H
#define BARAJA_LISTENER_H

#include <ros/ros.h>
#include <nodelet/nodelet.h>

#include <thread>

#include "baraja/bpc_packet.h"

namespace baraja
{

class BarajaListener : public nodelet::Nodelet
{
    public:
        ~BarajaListener();

        void onInit();

        void run();

    private:
        int open_socket(int port);

        boost::shared_ptr<std::thread> receive_thread_;

        ros::Publisher raw_udp_pub_;

        ros::NodeHandle pnh_;
        uint8_t recv_buffer_[BPC_PACKET_MAX_SIZE];
        int socket_fd_;
};

}

#endif
