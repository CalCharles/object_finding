// Generated by gencpp from file image_to_grid/homographies.msg
// DO NOT EDIT!


#ifndef IMAGE_TO_GRID_MESSAGE_HOMOGRAPHIES_H
#define IMAGE_TO_GRID_MESSAGE_HOMOGRAPHIES_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace image_to_grid
{
template <class ContainerAllocator>
struct homographies_
{
  typedef homographies_<ContainerAllocator> Type;

  homographies_()
    : floorX()
    , floorY()
    , objectX()
    , objectY()
    , size(0)
    , intervalSize(0.0)  {
    }
  homographies_(const ContainerAllocator& _alloc)
    : floorX(_alloc)
    , floorY(_alloc)
    , objectX(_alloc)
    , objectY(_alloc)
    , size(0)
    , intervalSize(0.0)  {
    }



   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _floorX_type;
  _floorX_type floorX;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _floorY_type;
  _floorY_type floorY;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _objectX_type;
  _objectX_type objectX;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _objectY_type;
  _objectY_type objectY;

   typedef int8_t _size_type;
  _size_type size;

   typedef float _intervalSize_type;
  _intervalSize_type intervalSize;




  typedef boost::shared_ptr< ::image_to_grid::homographies_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::image_to_grid::homographies_<ContainerAllocator> const> ConstPtr;

}; // struct homographies_

typedef ::image_to_grid::homographies_<std::allocator<void> > homographies;

typedef boost::shared_ptr< ::image_to_grid::homographies > homographiesPtr;
typedef boost::shared_ptr< ::image_to_grid::homographies const> homographiesConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::image_to_grid::homographies_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::image_to_grid::homographies_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace image_to_grid

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'image_to_grid': ['/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg', '/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/image_to_grid/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::image_to_grid::homographies_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::image_to_grid::homographies_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::image_to_grid::homographies_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::image_to_grid::homographies_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::image_to_grid::homographies_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::image_to_grid::homographies_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::image_to_grid::homographies_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e3b0945bcd6fa0c0d74e5f6a102c0551";
  }

  static const char* value(const ::image_to_grid::homographies_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe3b0945bcd6fa0c0ULL;
  static const uint64_t static_value2 = 0xd74e5f6a102c0551ULL;
};

template<class ContainerAllocator>
struct DataType< ::image_to_grid::homographies_<ContainerAllocator> >
{
  static const char* value()
  {
    return "image_to_grid/homographies";
  }

  static const char* value(const ::image_to_grid::homographies_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::image_to_grid::homographies_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32[] floorX\n\
int32[] floorY\n\
int32[] objectX\n\
int32[] objectY\n\
int8 size \n\
float32 intervalSize #should be 1/3 * the size of a tile\n\
";
  }

  static const char* value(const ::image_to_grid::homographies_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::image_to_grid::homographies_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.floorX);
      stream.next(m.floorY);
      stream.next(m.objectX);
      stream.next(m.objectY);
      stream.next(m.size);
      stream.next(m.intervalSize);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct homographies_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::image_to_grid::homographies_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::image_to_grid::homographies_<ContainerAllocator>& v)
  {
    s << indent << "floorX[]" << std::endl;
    for (size_t i = 0; i < v.floorX.size(); ++i)
    {
      s << indent << "  floorX[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.floorX[i]);
    }
    s << indent << "floorY[]" << std::endl;
    for (size_t i = 0; i < v.floorY.size(); ++i)
    {
      s << indent << "  floorY[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.floorY[i]);
    }
    s << indent << "objectX[]" << std::endl;
    for (size_t i = 0; i < v.objectX.size(); ++i)
    {
      s << indent << "  objectX[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.objectX[i]);
    }
    s << indent << "objectY[]" << std::endl;
    for (size_t i = 0; i < v.objectY.size(); ++i)
    {
      s << indent << "  objectY[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.objectY[i]);
    }
    s << indent << "size: ";
    Printer<int8_t>::stream(s, indent + "  ", v.size);
    s << indent << "intervalSize: ";
    Printer<float>::stream(s, indent + "  ", v.intervalSize);
  }
};

} // namespace message_operations
} // namespace ros

#endif // IMAGE_TO_GRID_MESSAGE_HOMOGRAPHIES_H
