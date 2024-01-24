# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_compressed_depth_image_transport_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED compressed_depth_image_transport_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(compressed_depth_image_transport_FOUND FALSE)
  elseif(NOT compressed_depth_image_transport_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(compressed_depth_image_transport_FOUND FALSE)
  endif()
  return()
endif()
set(_compressed_depth_image_transport_CONFIG_INCLUDED TRUE)

# output package information
if(NOT compressed_depth_image_transport_FIND_QUIETLY)
  message(STATUS "Found compressed_depth_image_transport: 2.3.3 (${compressed_depth_image_transport_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'compressed_depth_image_transport' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${compressed_depth_image_transport_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(compressed_depth_image_transport_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${compressed_depth_image_transport_DIR}/${_extra}")
endforeach()
