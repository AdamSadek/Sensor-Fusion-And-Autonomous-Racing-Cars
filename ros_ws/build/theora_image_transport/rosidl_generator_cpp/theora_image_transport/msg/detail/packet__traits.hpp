// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from theora_image_transport:msg/Packet.idl
// generated code does not contain a copyright notice

#ifndef THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__TRAITS_HPP_
#define THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__TRAITS_HPP_

#include "theora_image_transport/msg/detail/packet__struct.hpp"
#include <rosidl_runtime_cpp/traits.hpp>
#include <stdint.h>
#include <type_traits>

// Include directives for member types
// Member 'header'
#include "std_msgs/msg/detail/header__traits.hpp"

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<theora_image_transport::msg::Packet>()
{
  return "theora_image_transport::msg::Packet";
}

template<>
inline const char * name<theora_image_transport::msg::Packet>()
{
  return "theora_image_transport/msg/Packet";
}

template<>
struct has_fixed_size<theora_image_transport::msg::Packet>
  : std::integral_constant<bool, false> {};

template<>
struct has_bounded_size<theora_image_transport::msg::Packet>
  : std::integral_constant<bool, false> {};

template<>
struct is_message<theora_image_transport::msg::Packet>
  : std::true_type {};

}  // namespace rosidl_generator_traits

#endif  // THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__TRAITS_HPP_
