// Generated by gencpp from file kalman_zumy/NuSrvRequest.msg
// DO NOT EDIT!


#ifndef KALMAN_ZUMY_MESSAGE_NUSRVREQUEST_H
#define KALMAN_ZUMY_MESSAGE_NUSRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Transform.h>

namespace kalman_zumy
{
template <class ContainerAllocator>
struct NuSrvRequest_
{
  typedef NuSrvRequest_<ContainerAllocator> Type;

  NuSrvRequest_()
    : transform()
    , origin_tag()  {
    }
  NuSrvRequest_(const ContainerAllocator& _alloc)
    : transform(_alloc)
    , origin_tag(_alloc)  {
    }



   typedef  ::geometry_msgs::Transform_<ContainerAllocator>  _transform_type;
  _transform_type transform;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _origin_tag_type;
  _origin_tag_type origin_tag;




  typedef boost::shared_ptr< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct NuSrvRequest_

typedef ::kalman_zumy::NuSrvRequest_<std::allocator<void> > NuSrvRequest;

typedef boost::shared_ptr< ::kalman_zumy::NuSrvRequest > NuSrvRequestPtr;
typedef boost::shared_ptr< ::kalman_zumy::NuSrvRequest const> NuSrvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::kalman_zumy::NuSrvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace kalman_zumy

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/indigo/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a8d9d17b37b0c9a4256566443542d8f5";
  }

  static const char* value(const ::kalman_zumy::NuSrvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa8d9d17b37b0c9a4ULL;
  static const uint64_t static_value2 = 0x256566443542d8f5ULL;
};

template<class ContainerAllocator>
struct DataType< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "kalman_zumy/NuSrvRequest";
  }

  static const char* value(const ::kalman_zumy::NuSrvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Transform transform\n\
string origin_tag\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Transform\n\
# This represents the transform between two coordinate frames in free space.\n\
\n\
Vector3 translation\n\
Quaternion rotation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
";
  }

  static const char* value(const ::kalman_zumy::NuSrvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.transform);
      stream.next(m.origin_tag);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct NuSrvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::kalman_zumy::NuSrvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::kalman_zumy::NuSrvRequest_<ContainerAllocator>& v)
  {
    s << indent << "transform: ";
    s << std::endl;
    Printer< ::geometry_msgs::Transform_<ContainerAllocator> >::stream(s, indent + "  ", v.transform);
    s << indent << "origin_tag: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.origin_tag);
  }
};

} // namespace message_operations
} // namespace ros

#endif // KALMAN_ZUMY_MESSAGE_NUSRVREQUEST_H
