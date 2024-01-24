// generated from rosidl_generator_cpp/resource/rosidl_generator_cpp__visibility_control.hpp.in
// generated code does not contain a copyright notice

#ifndef THEORA_IMAGE_TRANSPORT__MSG__ROSIDL_GENERATOR_CPP__VISIBILITY_CONTROL_HPP_
#define THEORA_IMAGE_TRANSPORT__MSG__ROSIDL_GENERATOR_CPP__VISIBILITY_CONTROL_HPP_

#ifdef __cplusplus
extern "C"
{
#endif

// This logic was borrowed (then namespaced) from the examples on the gcc wiki:
//     https://gcc.gnu.org/wiki/Visibility

#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define ROSIDL_GENERATOR_CPP_EXPORT_theora_image_transport __attribute__ ((dllexport))
    #define ROSIDL_GENERATOR_CPP_IMPORT_theora_image_transport __attribute__ ((dllimport))
  #else
    #define ROSIDL_GENERATOR_CPP_EXPORT_theora_image_transport __declspec(dllexport)
    #define ROSIDL_GENERATOR_CPP_IMPORT_theora_image_transport __declspec(dllimport)
  #endif
  #ifdef ROSIDL_GENERATOR_CPP_BUILDING_DLL_theora_image_transport
    #define ROSIDL_GENERATOR_CPP_PUBLIC_theora_image_transport ROSIDL_GENERATOR_CPP_EXPORT_theora_image_transport
  #else
    #define ROSIDL_GENERATOR_CPP_PUBLIC_theora_image_transport ROSIDL_GENERATOR_CPP_IMPORT_theora_image_transport
  #endif
#else
  #define ROSIDL_GENERATOR_CPP_EXPORT_theora_image_transport __attribute__ ((visibility("default")))
  #define ROSIDL_GENERATOR_CPP_IMPORT_theora_image_transport
  #if __GNUC__ >= 4
    #define ROSIDL_GENERATOR_CPP_PUBLIC_theora_image_transport __attribute__ ((visibility("default")))
  #else
    #define ROSIDL_GENERATOR_CPP_PUBLIC_theora_image_transport
  #endif
#endif

#ifdef __cplusplus
}
#endif

#endif  // THEORA_IMAGE_TRANSPORT__MSG__ROSIDL_GENERATOR_CPP__VISIBILITY_CONTROL_HPP_
