// generated from rosidl_typesupport_introspection_c/resource/idl__type_support.c.em
// with input from theora_image_transport:msg/Packet.idl
// generated code does not contain a copyright notice

#include <stddef.h>
#include "theora_image_transport/msg/detail/packet__rosidl_typesupport_introspection_c.h"
#include "theora_image_transport/msg/rosidl_typesupport_introspection_c__visibility_control.h"
#include "rosidl_typesupport_introspection_c/field_types.h"
#include "rosidl_typesupport_introspection_c/identifier.h"
#include "rosidl_typesupport_introspection_c/message_introspection.h"
#include "theora_image_transport/msg/detail/packet__functions.h"
#include "theora_image_transport/msg/detail/packet__struct.h"


// Include directives for member types
// Member `header`
#include "std_msgs/msg/header.h"
// Member `header`
#include "std_msgs/msg/detail/header__rosidl_typesupport_introspection_c.h"
// Member `data`
#include "rosidl_runtime_c/primitives_sequence_functions.h"

#ifdef __cplusplus
extern "C"
{
#endif

void Packet__rosidl_typesupport_introspection_c__Packet_init_function(
  void * message_memory, enum rosidl_runtime_c__message_initialization _init)
{
  // TODO(karsten1987): initializers are not yet implemented for typesupport c
  // see https://github.com/ros2/ros2/issues/397
  (void) _init;
  theora_image_transport__msg__Packet__init(message_memory);
}

void Packet__rosidl_typesupport_introspection_c__Packet_fini_function(void * message_memory)
{
  theora_image_transport__msg__Packet__fini(message_memory);
}

static rosidl_typesupport_introspection_c__MessageMember Packet__rosidl_typesupport_introspection_c__Packet_message_member_array[6] = {
  {
    "header",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_MESSAGE,  // type
    0,  // upper bound of string
    NULL,  // members of sub message (initialized later)
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(theora_image_transport__msg__Packet, header),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "data",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_UINT8,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    true,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(theora_image_transport__msg__Packet, data),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "b_o_s",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_INT32,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(theora_image_transport__msg__Packet, b_o_s),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "e_o_s",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_INT32,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(theora_image_transport__msg__Packet, e_o_s),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "granulepos",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_INT64,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(theora_image_transport__msg__Packet, granulepos),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "packetno",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_INT64,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(theora_image_transport__msg__Packet, packetno),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL  // resize(index) function pointer
  }
};

static const rosidl_typesupport_introspection_c__MessageMembers Packet__rosidl_typesupport_introspection_c__Packet_message_members = {
  "theora_image_transport__msg",  // message namespace
  "Packet",  // message name
  6,  // number of fields
  sizeof(theora_image_transport__msg__Packet),
  Packet__rosidl_typesupport_introspection_c__Packet_message_member_array,  // message members
  Packet__rosidl_typesupport_introspection_c__Packet_init_function,  // function to initialize message memory (memory has to be allocated)
  Packet__rosidl_typesupport_introspection_c__Packet_fini_function  // function to terminate message instance (will not free memory)
};

// this is not const since it must be initialized on first access
// since C does not allow non-integral compile-time constants
static rosidl_message_type_support_t Packet__rosidl_typesupport_introspection_c__Packet_message_type_support_handle = {
  0,
  &Packet__rosidl_typesupport_introspection_c__Packet_message_members,
  get_message_typesupport_handle_function,
};

ROSIDL_TYPESUPPORT_INTROSPECTION_C_EXPORT_theora_image_transport
const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_c, theora_image_transport, msg, Packet)() {
  Packet__rosidl_typesupport_introspection_c__Packet_message_member_array[0].members_ =
    ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_c, std_msgs, msg, Header)();
  if (!Packet__rosidl_typesupport_introspection_c__Packet_message_type_support_handle.typesupport_identifier) {
    Packet__rosidl_typesupport_introspection_c__Packet_message_type_support_handle.typesupport_identifier =
      rosidl_typesupport_introspection_c__identifier;
  }
  return &Packet__rosidl_typesupport_introspection_c__Packet_message_type_support_handle;
}
#ifdef __cplusplus
}
#endif
