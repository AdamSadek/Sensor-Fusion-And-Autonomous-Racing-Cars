// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__rosidl_typesupport_fastrtps_cpp.hpp.em
// with input from theora_image_transport:msg/Packet.idl
// generated code does not contain a copyright notice

#ifndef THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__ROSIDL_TYPESUPPORT_FASTRTPS_CPP_HPP_
#define THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__ROSIDL_TYPESUPPORT_FASTRTPS_CPP_HPP_

#include "rosidl_runtime_c/message_type_support_struct.h"
#include "rosidl_typesupport_interface/macros.h"
#include "theora_image_transport/msg/rosidl_typesupport_fastrtps_cpp__visibility_control.h"
#include "theora_image_transport/msg/detail/packet__struct.hpp"

#ifndef _WIN32
# pragma GCC diagnostic push
# pragma GCC diagnostic ignored "-Wunused-parameter"
# ifdef __clang__
#  pragma clang diagnostic ignored "-Wdeprecated-register"
#  pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
# endif
#endif
#ifndef _WIN32
# pragma GCC diagnostic pop
#endif

#include "fastcdr/Cdr.h"

namespace theora_image_transport
{

namespace msg
{

namespace typesupport_fastrtps_cpp
{

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_theora_image_transport
cdr_serialize(
  const theora_image_transport::msg::Packet & ros_message,
  eprosima::fastcdr::Cdr & cdr);

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_theora_image_transport
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  theora_image_transport::msg::Packet & ros_message);

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_theora_image_transport
get_serialized_size(
  const theora_image_transport::msg::Packet & ros_message,
  size_t current_alignment);

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_theora_image_transport
max_serialized_size_Packet(
  bool & full_bounded,
  size_t current_alignment);

}  // namespace typesupport_fastrtps_cpp

}  // namespace msg

}  // namespace theora_image_transport

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_theora_image_transport
const rosidl_message_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, theora_image_transport, msg, Packet)();

#ifdef __cplusplus
}
#endif

#endif  // THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__ROSIDL_TYPESUPPORT_FASTRTPS_CPP_HPP_
