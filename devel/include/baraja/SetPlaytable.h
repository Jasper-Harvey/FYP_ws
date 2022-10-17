// Generated by gencpp from file baraja/SetPlaytable.msg
// DO NOT EDIT!


#ifndef BARAJA_MESSAGE_SETPLAYTABLE_H
#define BARAJA_MESSAGE_SETPLAYTABLE_H

#include <ros/service_traits.h>


#include <baraja/SetPlaytableRequest.h>
#include <baraja/SetPlaytableResponse.h>


namespace baraja
{

struct SetPlaytable
{

typedef SetPlaytableRequest Request;
typedef SetPlaytableResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetPlaytable
} // namespace baraja


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::baraja::SetPlaytable > {
  static const char* value()
  {
    return "9bf43e869557d516272a55c9c106e00b";
  }

  static const char* value(const ::baraja::SetPlaytable&) { return value(); }
};

template<>
struct DataType< ::baraja::SetPlaytable > {
  static const char* value()
  {
    return "baraja/SetPlaytable";
  }

  static const char* value(const ::baraja::SetPlaytable&) { return value(); }
};


// service_traits::MD5Sum< ::baraja::SetPlaytableRequest> should match
// service_traits::MD5Sum< ::baraja::SetPlaytable >
template<>
struct MD5Sum< ::baraja::SetPlaytableRequest>
{
  static const char* value()
  {
    return MD5Sum< ::baraja::SetPlaytable >::value();
  }
  static const char* value(const ::baraja::SetPlaytableRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::baraja::SetPlaytableRequest> should match
// service_traits::DataType< ::baraja::SetPlaytable >
template<>
struct DataType< ::baraja::SetPlaytableRequest>
{
  static const char* value()
  {
    return DataType< ::baraja::SetPlaytable >::value();
  }
  static const char* value(const ::baraja::SetPlaytableRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::baraja::SetPlaytableResponse> should match
// service_traits::MD5Sum< ::baraja::SetPlaytable >
template<>
struct MD5Sum< ::baraja::SetPlaytableResponse>
{
  static const char* value()
  {
    return MD5Sum< ::baraja::SetPlaytable >::value();
  }
  static const char* value(const ::baraja::SetPlaytableResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::baraja::SetPlaytableResponse> should match
// service_traits::DataType< ::baraja::SetPlaytable >
template<>
struct DataType< ::baraja::SetPlaytableResponse>
{
  static const char* value()
  {
    return DataType< ::baraja::SetPlaytable >::value();
  }
  static const char* value(const ::baraja::SetPlaytableResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // BARAJA_MESSAGE_SETPLAYTABLE_H