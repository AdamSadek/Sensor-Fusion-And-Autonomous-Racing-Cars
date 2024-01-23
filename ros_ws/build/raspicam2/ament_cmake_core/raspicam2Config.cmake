# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_raspicam2_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED raspicam2_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(raspicam2_FOUND FALSE)
  elseif(NOT raspicam2_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(raspicam2_FOUND FALSE)
  endif()
  return()
endif()
set(_raspicam2_CONFIG_INCLUDED TRUE)

# output package information
if(NOT raspicam2_FIND_QUIETLY)
  message(STATUS "Found raspicam2: 0.2.1 (${raspicam2_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'raspicam2' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${raspicam2_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(raspicam2_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${raspicam2_DIR}/${_extra}")
endforeach()
