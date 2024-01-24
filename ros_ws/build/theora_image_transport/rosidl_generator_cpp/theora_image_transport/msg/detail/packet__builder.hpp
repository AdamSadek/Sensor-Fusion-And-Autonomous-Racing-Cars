// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from theora_image_transport:msg/Packet.idl
// generated code does not contain a copyright notice

#ifndef THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__BUILDER_HPP_
#define THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__BUILDER_HPP_

#include "theora_image_transport/msg/detail/packet__struct.hpp"
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <utility>


namespace theora_image_transport
{

namespace msg
{

namespace builder
{

class Init_Packet_packetno
{
public:
  explicit Init_Packet_packetno(::theora_image_transport::msg::Packet & msg)
  : msg_(msg)
  {}
  ::theora_image_transport::msg::Packet packetno(::theora_image_transport::msg::Packet::_packetno_type arg)
  {
    msg_.packetno = std::move(arg);
    return std::move(msg_);
  }

private:
  ::theora_image_transport::msg::Packet msg_;
};

class Init_Packet_granulepos
{
public:
  explicit Init_Packet_granulepos(::theora_image_transport::msg::Packet & msg)
  : msg_(msg)
  {}
  Init_Packet_packetno granulepos(::theora_image_transport::msg::Packet::_granulepos_type arg)
  {
    msg_.granulepos = std::move(arg);
    return Init_Packet_packetno(msg_);
  }

private:
  ::theora_image_transport::msg::Packet msg_;
};

class Init_Packet_e_o_s
{
public:
  explicit Init_Packet_e_o_s(::theora_image_transport::msg::Packet & msg)
  : msg_(msg)
  {}
  Init_Packet_granulepos e_o_s(::theora_image_transport::msg::Packet::_e_o_s_type arg)
  {
    msg_.e_o_s = std::move(arg);
    return Init_Packet_granulepos(msg_);
  }

private:
  ::theora_image_transport::msg::Packet msg_;
};

class Init_Packet_b_o_s
{
public:
  explicit Init_Packet_b_o_s(::theora_image_transport::msg::Packet & msg)
  : msg_(msg)
  {}
  Init_Packet_e_o_s b_o_s(::theora_image_transport::msg::Packet::_b_o_s_type arg)
  {
    msg_.b_o_s = std::move(arg);
    return Init_Packet_e_o_s(msg_);
  }

private:
  ::theora_image_transport::msg::Packet msg_;
};

class Init_Packet_data
{
public:
  explicit Init_Packet_data(::theora_image_transport::msg::Packet & msg)
  : msg_(msg)
  {}
  Init_Packet_b_o_s data(::theora_image_transport::msg::Packet::_data_type arg)
  {
    msg_.data = std::move(arg);
    return Init_Packet_b_o_s(msg_);
  }

private:
  ::theora_image_transport::msg::Packet msg_;
};

class Init_Packet_header
{
public:
  Init_Packet_header()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Packet_data header(::theora_image_transport::msg::Packet::_header_type arg)
  {
    msg_.header = std::move(arg);
    return Init_Packet_data(msg_);
  }

private:
  ::theora_image_transport::msg::Packet msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::theora_image_transport::msg::Packet>()
{
  return theora_image_transport::msg::builder::Init_Packet_header();
}

}  // namespace theora_image_transport

#endif  // THEORA_IMAGE_TRANSPORT__MSG__DETAIL__PACKET__BUILDER_HPP_
