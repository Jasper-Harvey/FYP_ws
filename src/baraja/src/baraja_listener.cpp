#include "baraja/baraja_listener.h"

#include <pluginlib/class_list_macros.h>

#include <thread>

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <baraja/RawUdp.h>
#include <baraja/RawUdpArray.h>

const int MAX_SOCKET_RECEIVE_BUFFER = 16 * 1024 * 1024;
const int MAX_PACKET_BATCH_SIZE = 100;

// Register this nodelet
PLUGINLIB_EXPORT_CLASS(baraja::BarajaListener, nodelet::Nodelet)

void receive_thread(baraja::BarajaListener* listener)
{
    while (true)
    {
        ROS_INFO_STREAM("Starting receive thread");
        listener->run();
        ROS_ERROR_STREAM("Receive thread failed");
    }
}

void baraja::BarajaListener::onInit()
{
    pnh_ = getPrivateNodeHandle();

    // Read parameters
    int port;
    pnh_.param("port", port, 5044);

    open_socket(port);

    raw_udp_pub_ = getNodeHandle().advertise<baraja::RawUdpArray>("baraja_udp_batched", 1000);

    receive_thread_ = boost::shared_ptr<std::thread>(new std::thread(receive_thread, this));
}

void baraja::BarajaListener::run()
{
    baraja::RawUdpArray::Ptr udp_array(new baraja::RawUdpArray);

    while (true)
    {
        struct sockaddr_in recv_addr;
        memset(&recv_addr, 0, sizeof(recv_addr));
        socklen_t addr_len = sizeof(recv_addr);

        int recv = recvfrom(socket_fd_, recv_buffer_, BPC_PACKET_MAX_SIZE, 0, (struct sockaddr*) &recv_addr, &addr_len);

        const bool batch_filled = (udp_array->packets.size() > MAX_PACKET_BATCH_SIZE);
        const bool batch_expired = ((recv <= 0) && (udp_array->packets.size() > 0));

        // To reduce the frequency of udp topic publishing, batch incoming packets into chunks before publishing.
        if (batch_filled || batch_expired)
        {
            raw_udp_pub_.publish(udp_array);
            udp_array = baraja::RawUdpArray::Ptr(new baraja::RawUdpArray);
        }

        if (recv > 0)
        {
            char* recv_ip = inet_ntoa(recv_addr.sin_addr);

            baraja::RawUdp raw_udp;
            raw_udp.engine_ip = std::string(recv_ip);
            raw_udp.udp_buffer = std::vector<int8_t>(recv_buffer_, recv_buffer_ + recv);

            udp_array->packets.push_back(raw_udp);
        }
    }
}

baraja::BarajaListener::~BarajaListener()
{
    close(socket_fd_);
}

// Open the UDP socket for receiving packets from the LIDAR
int baraja::BarajaListener::open_socket(int port)
{
    struct sockaddr_in serv_addr;
    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(port);

    socket_fd_ = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, IPPROTO_UDP);
    if (socket_fd_ == -1)
    {
        ROS_FATAL_STREAM("Could not create UDP socket");
        return -1;
    }

    int enable = 1;
    if (setsockopt(socket_fd_, SOL_SOCKET, SO_REUSEADDR, &enable, sizeof(int)) < 0)
    {
        ROS_FATAL_STREAM("Could not set socket to shared");
        return -1;
    }

    int recv_buffer_size = MAX_SOCKET_RECEIVE_BUFFER;
    if (setsockopt(socket_fd_, SOL_SOCKET, SO_RCVBUF, &recv_buffer_size, sizeof(recv_buffer_size)) == -1)
    {
        ROS_ERROR_STREAM("Error setting socket opts: " << strerror(errno));
    }
    
    // Set 100ms timeout for incoomplete batches
    struct timeval socket_timeout;
    socket_timeout.tv_sec = 0;
    socket_timeout.tv_usec = 100000;

    if (setsockopt(socket_fd_, SOL_SOCKET, SO_RCVTIMEO, &socket_timeout, sizeof(socket_timeout)) < 0) {
        ROS_ERROR_STREAM("Error setting SO_RCVTIMEO socket opts: " << strerror(errno));
    }

    int result = bind(socket_fd_, (struct sockaddr*)&serv_addr, sizeof(serv_addr));
    if (result != 0)
    {
        close(socket_fd_);
        ROS_FATAL_STREAM("Could not bind UDP socket");
        return -2;
    }

    return 0;
}
