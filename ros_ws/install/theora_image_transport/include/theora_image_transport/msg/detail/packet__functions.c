// generated from rosidl_generator_c/resource/idl__functions.c.em
// with input from theora_image_transport:msg/Packet.idl
// generated code does not contain a copyright notice
#include "theora_image_transport/msg/detail/packet__functions.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "rcutils/allocator.h"


// Include directives for member types
// Member `header`
#include "std_msgs/msg/detail/header__functions.h"
// Member `data`
#include "rosidl_runtime_c/primitives_sequence_functions.h"

bool
theora_image_transport__msg__Packet__init(theora_image_transport__msg__Packet * msg)
{
  if (!msg) {
    return false;
  }
  // header
  if (!std_msgs__msg__Header__init(&msg->header)) {
    theora_image_transport__msg__Packet__fini(msg);
    return false;
  }
  // data
  if (!rosidl_runtime_c__uint8__Sequence__init(&msg->data, 0)) {
    theora_image_transport__msg__Packet__fini(msg);
    return false;
  }
  // b_o_s
  // e_o_s
  // granulepos
  // packetno
  return true;
}

void
theora_image_transport__msg__Packet__fini(theora_image_transport__msg__Packet * msg)
{
  if (!msg) {
    return;
  }
  // header
  std_msgs__msg__Header__fini(&msg->header);
  // data
  rosidl_runtime_c__uint8__Sequence__fini(&msg->data);
  // b_o_s
  // e_o_s
  // granulepos
  // packetno
}

bool
theora_image_transport__msg__Packet__are_equal(const theora_image_transport__msg__Packet * lhs, const theora_image_transport__msg__Packet * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // header
  if (!std_msgs__msg__Header__are_equal(
      &(lhs->header), &(rhs->header)))
  {
    return false;
  }
  // data
  if (!rosidl_runtime_c__uint8__Sequence__are_equal(
      &(lhs->data), &(rhs->data)))
  {
    return false;
  }
  // b_o_s
  if (lhs->b_o_s != rhs->b_o_s) {
    return false;
  }
  // e_o_s
  if (lhs->e_o_s != rhs->e_o_s) {
    return false;
  }
  // granulepos
  if (lhs->granulepos != rhs->granulepos) {
    return false;
  }
  // packetno
  if (lhs->packetno != rhs->packetno) {
    return false;
  }
  return true;
}

bool
theora_image_transport__msg__Packet__copy(
  const theora_image_transport__msg__Packet * input,
  theora_image_transport__msg__Packet * output)
{
  if (!input || !output) {
    return false;
  }
  // header
  if (!std_msgs__msg__Header__copy(
      &(input->header), &(output->header)))
  {
    return false;
  }
  // data
  if (!rosidl_runtime_c__uint8__Sequence__copy(
      &(input->data), &(output->data)))
  {
    return false;
  }
  // b_o_s
  output->b_o_s = input->b_o_s;
  // e_o_s
  output->e_o_s = input->e_o_s;
  // granulepos
  output->granulepos = input->granulepos;
  // packetno
  output->packetno = input->packetno;
  return true;
}

theora_image_transport__msg__Packet *
theora_image_transport__msg__Packet__create()
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  theora_image_transport__msg__Packet * msg = (theora_image_transport__msg__Packet *)allocator.allocate(sizeof(theora_image_transport__msg__Packet), allocator.state);
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(theora_image_transport__msg__Packet));
  bool success = theora_image_transport__msg__Packet__init(msg);
  if (!success) {
    allocator.deallocate(msg, allocator.state);
    return NULL;
  }
  return msg;
}

void
theora_image_transport__msg__Packet__destroy(theora_image_transport__msg__Packet * msg)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  if (msg) {
    theora_image_transport__msg__Packet__fini(msg);
  }
  allocator.deallocate(msg, allocator.state);
}


bool
theora_image_transport__msg__Packet__Sequence__init(theora_image_transport__msg__Packet__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  theora_image_transport__msg__Packet * data = NULL;

  if (size) {
    data = (theora_image_transport__msg__Packet *)allocator.zero_allocate(size, sizeof(theora_image_transport__msg__Packet), allocator.state);
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = theora_image_transport__msg__Packet__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        theora_image_transport__msg__Packet__fini(&data[i - 1]);
      }
      allocator.deallocate(data, allocator.state);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
theora_image_transport__msg__Packet__Sequence__fini(theora_image_transport__msg__Packet__Sequence * array)
{
  if (!array) {
    return;
  }
  rcutils_allocator_t allocator = rcutils_get_default_allocator();

  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      theora_image_transport__msg__Packet__fini(&array->data[i]);
    }
    allocator.deallocate(array->data, allocator.state);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

theora_image_transport__msg__Packet__Sequence *
theora_image_transport__msg__Packet__Sequence__create(size_t size)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  theora_image_transport__msg__Packet__Sequence * array = (theora_image_transport__msg__Packet__Sequence *)allocator.allocate(sizeof(theora_image_transport__msg__Packet__Sequence), allocator.state);
  if (!array) {
    return NULL;
  }
  bool success = theora_image_transport__msg__Packet__Sequence__init(array, size);
  if (!success) {
    allocator.deallocate(array, allocator.state);
    return NULL;
  }
  return array;
}

void
theora_image_transport__msg__Packet__Sequence__destroy(theora_image_transport__msg__Packet__Sequence * array)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  if (array) {
    theora_image_transport__msg__Packet__Sequence__fini(array);
  }
  allocator.deallocate(array, allocator.state);
}

bool
theora_image_transport__msg__Packet__Sequence__are_equal(const theora_image_transport__msg__Packet__Sequence * lhs, const theora_image_transport__msg__Packet__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!theora_image_transport__msg__Packet__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
theora_image_transport__msg__Packet__Sequence__copy(
  const theora_image_transport__msg__Packet__Sequence * input,
  theora_image_transport__msg__Packet__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(theora_image_transport__msg__Packet);
    theora_image_transport__msg__Packet * data =
      (theora_image_transport__msg__Packet *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!theora_image_transport__msg__Packet__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          theora_image_transport__msg__Packet__fini(&data[i]);
        }
        free(data);
        return false;
      }
    }
    output->data = data;
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!theora_image_transport__msg__Packet__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}
