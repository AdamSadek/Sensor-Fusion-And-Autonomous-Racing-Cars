// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from theora_image_transport:msg/Packet.idl
// generated code does not contain a copyright notice

#ifndef THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__STRUCT_HPP_
#define THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__STRUCT_HPP_

#include <rosidl_runtime_cpp/bounded_vector.hpp>
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>


// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__struct.hpp"

#ifndef _WIN32
# define DEPRECATED__theora_image_transport__msg__Packet __attribute__((deprecated))
#else
# define DEPRECATED__theora_image_transport__msg__Packet __declspec(deprecated)
#endif

namespace theora_image_transport
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct Packet_
{
  using Type = Packet_<ContainerAllocator>;

  explicit Packet_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : header(_init)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->b_o_s = 0l;
      this->e_o_s = 0l;
      this->granulepos = 0ll;
      this->packetno = 0ll;
    }
  }

  explicit Packet_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  : header(_alloc, _init)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->b_o_s = 0l;
      this->e_o_s = 0l;
      this->granulepos = 0ll;
      this->packetno = 0ll;
    }
  }

  // field types and members
  using _header_type =
    std_msgs::msg::Header_<ContainerAllocator>;
  _header_type header;
  using _data_type =
    std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other>;
  _data_type data;
  using _b_o_s_type =
    int32_t;
  _b_o_s_type b_o_s;
  using _e_o_s_type =
    int32_t;
  _e_o_s_type e_o_s;
  using _granulepos_type =
    int64_t;
  _granulepos_type granulepos;
  using _packetno_type =
    int64_t;
  _packetno_type packetno;

  // setters for named parameter idiom
  Type & set__header(
    const std_msgs::msg::Header_<ContainerAllocator> & _arg)
  {
    this->header = _arg;
    return *this;
  }
  Type & set__data(
    const std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other> & _arg)
  {
    this->data = _arg;
    return *this;
  }
  Type & set__b_o_s(
    const int32_t & _arg)
  {
    this->b_o_s = _arg;
    return *this;
  }
  Type & set__e_o_s(
    const int32_t & _arg)
  {
    this->e_o_s = _arg;
    return *this;
  }
  Type & set__granulepos(
    const int64_t & _arg)
  {
    this->granulepos = _arg;
    return *this;
  }
  Type & set__packetno(
    const int64_t & _arg)
  {
    this->packetno = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    theora_image_transport::msg::Packet_<ContainerAllocator> *;
  using ConstRawPtr =
    const theora_image_transport::msg::Packet_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<theora_image_transport::msg::Packet_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<theora_image_transport::msg::Packet_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      theora_image_transport::msg::Packet_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<theora_image_transport::msg::Packet_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      theora_image_transport::msg::Packet_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<theora_image_transport::msg::Packet_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<theora_image_transport::msg::Packet_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<theora_image_transport::msg::Packet_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__theora_image_transport__msg__Packet
    std::shared_ptr<theora_image_transport::msg::Packet_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__theora_image_transport__msg__Packet
    std::shared_ptr<theora_image_transport::msg::Packet_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const Packet_ & other) const
  {
    if (this->header != other.header) {
      return false;
    }
    if (this->data != other.data) {
      return false;
    }
    if (this->b_o_s != other.b_o_s) {
      return false;
    }
    if (this->e_o_s != other.e_o_s) {
      return false;
    }
    if (this->granulepos != other.granulepos) {
      return false;
    }
    if (this->packetno != other.packetno) {
      return false;
    }
    return true;
  }
  bool operator!=(const Packet_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct Packet_

// alias to use template instance with default allocator
using Packet =
  theora_image_transport::msg::Packet_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace theora_image_transport

#endif  // THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__STRUCT_HPP_
