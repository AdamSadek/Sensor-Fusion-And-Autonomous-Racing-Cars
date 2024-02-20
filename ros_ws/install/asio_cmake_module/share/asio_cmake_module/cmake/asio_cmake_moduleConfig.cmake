# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_asio_cmake_module_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED asio_cmake_module_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(asio_cmake_module_FOUND FALSE)
  elseif(NOT asio_cmake_module_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(asio_cmake_module_FOUND FALSE)
  endif()
  return()
endif()
set(_asio_cmake_module_CONFIG_INCLUDED TRUE)

# output package information
if(NOT asio_cmake_module_FIND_QUIETLY)
  message(STATUS "Found asio_cmake_module: 1.0.0 (${asio_cmake_module_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'asio_cmake_module' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${asio_cmake_module_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(asio_cmake_module_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "asio_cmake_module-extras.cmake")
foreach(_extra ${_extras})
  include("${asio_cmake_module_DIR}/${_extra}")
endforeach()
