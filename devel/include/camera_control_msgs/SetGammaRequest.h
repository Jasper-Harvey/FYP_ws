// Generated by gencpp from file camera_control_msgs/SetGammaRequest.msg
// DO NOT EDIT!


#ifndef CAMERA_CONTROL_MSGS_MESSAGE_SETGAMMAREQUEST_H
#define CAMERA_CONTROL_MSGS_MESSAGE_SETGAMMAREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace camera_control_msgs
{
template <class ContainerAllocator>
struct SetGammaRequest_
{
  typedef SetGammaRequest_<ContainerAllocator> Type;

  SetGammaRequest_()
    : target_gamma(0.0)  {
    }
  SetGammaRequest_(const ContainerAllocator& _alloc)
    : target_gamma(0.0)  {
  (void)_alloc;
    }



   typedef float _target_gamma_type;
  _target_gamma_type target_gamma;





  typedef boost::shared_ptr< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetGammaRequest_

typedef ::camera_control_msgs::SetGammaRequest_<std::allocator<void> > SetGammaRequest;

typedef boost::shared_ptr< ::camera_control_msgs::SetGammaRequest > SetGammaRequestPtr;
typedef boost::shared_ptr< ::camera_control_msgs::SetGammaRequest const> SetGammaRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::camera_control_msgs::SetGammaRequest_<ContainerAllocator1> & lhs, const ::camera_control_msgs::SetGammaRequest_<ContainerAllocator2> & rhs)
{
  return lhs.target_gamma == rhs.target_gamma;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::camera_control_msgs::SetGammaRequest_<ContainerAllocator1> & lhs, const ::camera_control_msgs::SetGammaRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace camera_control_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0a9682c360c7e6178269a064cdf9a0c9";
  }

  static const char* value(const ::camera_control_msgs::SetGammaRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0a9682c360c7e617ULL;
  static const uint64_t static_value2 = 0x8269a064cdf9a0c9ULL;
};

template<class ContainerAllocator>
struct DataType< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "camera_control_msgs/SetGammaRequest";
  }

  static const char* value(const ::camera_control_msgs::SetGammaRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# The target gamma correction of pixel intensity.\n"
"# Adjusts the brightness of the pixel values output by the camera's sensor\n"
"# to account for a non-linearity in the human perception of brightness or\n"
"# of the display system (such as CRT).\n"
"float32 target_gamma\n"
;
  }

  static const char* value(const ::camera_control_msgs::SetGammaRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.target_gamma);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetGammaRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::camera_control_msgs::SetGammaRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::camera_control_msgs::SetGammaRequest_<ContainerAllocator>& v)
  {
    s << indent << "target_gamma: ";
    Printer<float>::stream(s, indent + "  ", v.target_gamma);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CAMERA_CONTROL_MSGS_MESSAGE_SETGAMMAREQUEST_H
