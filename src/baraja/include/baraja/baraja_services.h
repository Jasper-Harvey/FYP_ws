#ifndef BARAJA_SERVICES_H
#define BARAJA_SERVICES_H

#include <ros/ros.h>
#include <std_srvs/SetBool.h>

#include <string>

#include <baraja/bpc_packet.h>

// Auto-generated message and service headers
#include "baraja/SetPlaytable.h"

namespace baraja
{

class BarajaServices
{
public:
    BarajaServices();
    ~BarajaServices();

    void set(ros::NodeHandle pnh, const std::string & engine_ip);
    bool set_playtable(baraja::SetPlaytable::Request & req, baraja::SetPlaytable::Response & res);
    bool set_run(std_srvs::SetBool::Request & req, std_srvs::SetBool::Response & res);

private:
    ros::NodeHandle pnh_;

    ros::ServiceServer playtable_service_;
    ros::ServiceServer run_service_;

    std::string engine_ip_;

};

}

#endif
