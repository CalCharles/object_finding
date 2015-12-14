// Generated by gencpp from file kalman_zumy/NuSrv.msg
// DO NOT EDIT!


#ifndef KALMAN_ZUMY_MESSAGE_NUSRV_H
#define KALMAN_ZUMY_MESSAGE_NUSRV_H

#include <ros/service_traits.h>


#include <kalman_zumy/NuSrvRequest.h>
#include <kalman_zumy/NuSrvResponse.h>


namespace kalman_zumy
{

struct NuSrv
{

typedef NuSrvRequest Request;
typedef NuSrvResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct NuSrv
} // namespace kalman_zumy


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::kalman_zumy::NuSrv > {
  static const char* value()
  {
    return "a8d9d17b37b0c9a4256566443542d8f5";
  }

  static const char* value(const ::kalman_zumy::NuSrv&) { return value(); }
};

template<>
struct DataType< ::kalman_zumy::NuSrv > {
  static const char* value()
  {
    return "kalman_zumy/NuSrv";
  }

  static const char* value(const ::kalman_zumy::NuSrv&) { return value(); }
};


// service_traits::MD5Sum< ::kalman_zumy::NuSrvRequest> should match 
// service_traits::MD5Sum< ::kalman_zumy::NuSrv > 
template<>
struct MD5Sum< ::kalman_zumy::NuSrvRequest>
{
  static const char* value()
  {
    return MD5Sum< ::kalman_zumy::NuSrv >::value();
  }
  static const char* value(const ::kalman_zumy::NuSrvRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::kalman_zumy::NuSrvRequest> should match 
// service_traits::DataType< ::kalman_zumy::NuSrv > 
template<>
struct DataType< ::kalman_zumy::NuSrvRequest>
{
  static const char* value()
  {
    return DataType< ::kalman_zumy::NuSrv >::value();
  }
  static const char* value(const ::kalman_zumy::NuSrvRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::kalman_zumy::NuSrvResponse> should match 
// service_traits::MD5Sum< ::kalman_zumy::NuSrv > 
template<>
struct MD5Sum< ::kalman_zumy::NuSrvResponse>
{
  static const char* value()
  {
    return MD5Sum< ::kalman_zumy::NuSrv >::value();
  }
  static const char* value(const ::kalman_zumy::NuSrvResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::kalman_zumy::NuSrvResponse> should match 
// service_traits::DataType< ::kalman_zumy::NuSrv > 
template<>
struct DataType< ::kalman_zumy::NuSrvResponse>
{
  static const char* value()
  {
    return DataType< ::kalman_zumy::NuSrv >::value();
  }
  static const char* value(const ::kalman_zumy::NuSrvResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // KALMAN_ZUMY_MESSAGE_NUSRV_H