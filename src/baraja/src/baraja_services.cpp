#include <baraja/baraja_services.h>

#include <chrono>
#include <iostream>

#include <ros/console.h>


#include <baraja/bpc_packet.h>

const std::chrono::seconds SERVICE_TIMEOUT = std::chrono::seconds(2);

using namespace baraja;
#if BARAJA_SERVICES_ENABLED

#include <cpprest/http_client.h>
using namespace web;
using namespace web::http;
using namespace web::http::client;
#endif

BarajaServices::BarajaServices()
{
}

BarajaServices::~BarajaServices()
{
}

bool BarajaServices::set_playtable(SetPlaytable::Request& req, SetPlaytable::Response& res)
{
#if BARAJA_SERVICES_ENABLED
    ROS_DEBUG_STREAM("Playtable switched: " << req.playtable);

    res.success = false;

    // generate request
    http_client_config config;
    config.set_timeout(SERVICE_TIMEOUT);

    const std::string url = std::string("http://") + engine_ip_ + std::string(":8007");
    http_client client(url, config);

    http_request request(methods::GET);
    request.set_request_uri(std::string("configuration/set?pt_selection=") + req.playtable);

    // send request
    auto task = client.request(request);

    task.then([](http_response response) -> pplx::task<json::value> {
            if (response.status_code() == status_codes::OK)
            {
                return response.extract_json();
            }

            // Handle error cases, for now return empty json value...
            return pplx::task_from_result(json::value());
        })
        .then([&res](pplx::task<json::value> previousTask) {
            try
            {
                // Perform actions here to process the JSON value...
                json::value v = previousTask.get();
                if (v["Error"].as_integer() == 0)
                {
                    res.success = true;
                }
            }
            catch (const http_exception& e)
            {
                // Print error.
                ROS_ERROR_STREAM("Exception: " << e.what());
            }
        })
        .wait();

    return true;
#else
    ROS_ERROR_STREAM("Attempted to set playtable but Baraja driver was not compiled with services support.");
    return false;
#endif
}

bool BarajaServices::set_run(std_srvs::SetBool::Request& req, std_srvs::SetBool::Response& res)
{
#if BARAJA_SERVICES_ENABLED
    ROS_DEBUG_STREAM("Run mode changed: " << req.data);

    res.success = false;
    res.message = "";

    // generate request
    http_client_config config;
    config.set_timeout(SERVICE_TIMEOUT);

    const std::string url = std::string("http://") + engine_ip_ + std::string(":8007");
    http_client client(url, config);

    http_request request(methods::GET);

    // set to run
    if (req.data)
    {
        request.set_request_uri("mode/set/run");
    }
    else
    {
        request.set_request_uri("mode/set/idle");
    }

    // send request
    auto task = client.request(request);

    task.then([](http_response response) -> pplx::task<json::value> {
            if (response.status_code() == status_codes::OK)
            {
                return response.extract_json();
            }

            // Handle error cases, for now return empty json value...
            return pplx::task_from_result(json::value());
        })
        .then([&res](pplx::task<json::value> previousTask) {
            try
            {
                // Perform actions here to process the JSON value...
                json::value v = previousTask.get();
                if (v["Error"].as_integer() == 0)
                {
                    res.success = true;
                }
            }
            catch (const http_exception& e)
            {
                // Print error.
                ROS_ERROR_STREAM("Exception: " << e.what());
            }
        })
        .wait();

    return true;
#else
    ROS_ERROR_STREAM("Attempted to set running but Baraja driver was not compiled with services support.");
    return false;
#endif
}

void BarajaServices::set(ros::NodeHandle pnh, const std::string& engine_ip)
{
#if BARAJA_SERVICES_ENABLED
    engine_ip_ = engine_ip;

    pnh_ = pnh;
    playtable_service_ = pnh_.advertiseService("set_pt_selection", &BarajaServices::set_playtable, this);
    run_service_ = pnh_.advertiseService("set_run", &BarajaServices::set_run, this);
#endif
}
