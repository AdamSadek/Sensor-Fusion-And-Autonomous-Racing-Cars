# Install script for directory: /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/install/theora_image_transport")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/rosidl_interfaces" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_index/share/ament_index/resource_index/rosidl_interfaces/theora_image_transport")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/theora_image_transport" TYPE DIRECTORY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_c/theora_image_transport/" REGEX "/[^/]*\\.h$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/environment" TYPE FILE FILES "/opt/ros/foxy/lib/python3.8/site-packages/ament_package/template/environment_hook/library_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/environment" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/library_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_generator_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_generator_c.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_generator_c.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/libtheora_image_transport__rosidl_generator_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_generator_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_generator_c.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_generator_c.so"
         OLD_RPATH "/opt/ros/foxy/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_generator_c.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/theora_image_transport" TYPE DIRECTORY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_typesupport_fastrtps_c/theora_image_transport/" REGEX "/[^/]*\\.cpp$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_c.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_c.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/libtheora_image_transport__rosidl_typesupport_fastrtps_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_c.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_c.so"
         OLD_RPATH "/opt/ros/foxy/lib:/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_c.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/theora_image_transport" TYPE DIRECTORY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_typesupport_fastrtps_cpp/theora_image_transport/" REGEX "/[^/]*\\.cpp$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_cpp.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_cpp.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/libtheora_image_transport__rosidl_typesupport_fastrtps_cpp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_cpp.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_cpp.so"
         OLD_RPATH "/opt/ros/foxy/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_fastrtps_cpp.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/theora_image_transport" TYPE DIRECTORY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_typesupport_introspection_c/theora_image_transport/" REGEX "/[^/]*\\.h$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_c.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_c.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/libtheora_image_transport__rosidl_typesupport_introspection_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_c.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_c.so"
         OLD_RPATH "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport:/opt/ros/foxy/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_c.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_c.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_c.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/libtheora_image_transport__rosidl_typesupport_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_c.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_c.so"
         OLD_RPATH "/opt/ros/foxy/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_c.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/theora_image_transport" TYPE DIRECTORY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_cpp/theora_image_transport/" REGEX "/[^/]*\\.hpp$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/theora_image_transport" TYPE DIRECTORY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_typesupport_introspection_cpp/theora_image_transport/" REGEX "/[^/]*\\.hpp$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_cpp.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_cpp.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/libtheora_image_transport__rosidl_typesupport_introspection_cpp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_cpp.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_cpp.so"
         OLD_RPATH "/opt/ros/foxy/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_introspection_cpp.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_cpp.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_cpp.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/libtheora_image_transport__rosidl_typesupport_cpp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_cpp.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_cpp.so"
         OLD_RPATH "/opt/ros/foxy/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__rosidl_typesupport_cpp.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/environment" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/pythonpath.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/environment" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/pythonpath.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_py/theora_image_transport/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(
        COMMAND
        "/usr/bin/python3" "-m" "compileall"
        "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/install/theora_image_transport/lib/python3.8/site-packages/theora_image_transport/__init__.py"
      )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/msg" TYPE DIRECTORY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_py/theora_image_transport/msg/" REGEX "/[^/]*\\.py$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_fastrtps_c.cpython-38-aarch64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_fastrtps_c.cpython-38-aarch64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_fastrtps_c.cpython-38-aarch64-linux-gnu.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_py/theora_image_transport/theora_image_transport_s__rosidl_typesupport_fastrtps_c.cpython-38-aarch64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_fastrtps_c.cpython-38-aarch64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_fastrtps_c.cpython-38-aarch64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_fastrtps_c.cpython-38-aarch64-linux-gnu.so"
         OLD_RPATH "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_py/theora_image_transport:/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport:/opt/ros/foxy/lib:/opt/ros/foxy/share/builtin_interfaces/cmake/../../../lib:/opt/ros/foxy/share/std_msgs/cmake/../../../lib:/opt/ros/foxy/share/sensor_msgs/cmake/../../../lib:/opt/ros/foxy/share/geometry_msgs/cmake/../../../lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_fastrtps_c.cpython-38-aarch64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_introspection_c.cpython-38-aarch64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_introspection_c.cpython-38-aarch64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_introspection_c.cpython-38-aarch64-linux-gnu.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_py/theora_image_transport/theora_image_transport_s__rosidl_typesupport_introspection_c.cpython-38-aarch64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_introspection_c.cpython-38-aarch64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_introspection_c.cpython-38-aarch64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_introspection_c.cpython-38-aarch64-linux-gnu.so"
         OLD_RPATH "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_py/theora_image_transport:/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport:/opt/ros/foxy/lib:/opt/ros/foxy/share/builtin_interfaces/cmake/../../../lib:/opt/ros/foxy/share/std_msgs/cmake/../../../lib:/opt/ros/foxy/share/sensor_msgs/cmake/../../../lib:/opt/ros/foxy/share/geometry_msgs/cmake/../../../lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_introspection_c.cpython-38-aarch64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_c.cpython-38-aarch64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_c.cpython-38-aarch64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_c.cpython-38-aarch64-linux-gnu.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_py/theora_image_transport/theora_image_transport_s__rosidl_typesupport_c.cpython-38-aarch64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_c.cpython-38-aarch64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_c.cpython-38-aarch64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_c.cpython-38-aarch64-linux-gnu.so"
         OLD_RPATH "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_py/theora_image_transport:/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport:/opt/ros/foxy/lib:/opt/ros/foxy/share/builtin_interfaces/cmake/../../../lib:/opt/ros/foxy/share/std_msgs/cmake/../../../lib:/opt/ros/foxy/share/sensor_msgs/cmake/../../../lib:/opt/ros/foxy/share/geometry_msgs/cmake/../../../lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python3.8/site-packages/theora_image_transport/theora_image_transport_s__rosidl_typesupport_c.cpython-38-aarch64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__python.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__python.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__python.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_generator_py/theora_image_transport/libtheora_image_transport__python.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__python.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__python.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__python.so"
         OLD_RPATH "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport:/opt/ros/foxy/share/builtin_interfaces/cmake/../../../lib:/opt/ros/foxy/share/std_msgs/cmake/../../../lib:/opt/ros/foxy/share/sensor_msgs/cmake/../../../lib:/opt/ros/foxy/share/geometry_msgs/cmake/../../../lib:/opt/ros/foxy/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtheora_image_transport__python.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/msg" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_adapter/theora_image_transport/msg/Packet.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/msg" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport/msg/Packet.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/theora_image_transport/libtheora_image_transport_component.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/theora_image_transport/libtheora_image_transport_component.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/theora_image_transport/libtheora_image_transport_component.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/theora_image_transport" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/libtheora_image_transport_component.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/theora_image_transport/libtheora_image_transport_component.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/theora_image_transport/libtheora_image_transport_component.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/theora_image_transport/libtheora_image_transport_component.so"
         OLD_RPATH "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/install/image_transport/lib:/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/install/cv_bridge/lib:/opt/ros/foxy/lib:/opt/ros/foxy/lib/aarch64-linux-gnu:/usr/local/lib:/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/theora_image_transport/libtheora_image_transport_component.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/ogg_saver" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/ogg_saver")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/ogg_saver"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ogg_saver")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/ogg_saver" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/ogg_saver")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/ogg_saver"
         OLD_RPATH "/usr/local/lib:/opt/ros/foxy/lib:/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/ogg_saver")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport/include/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport/theora_plugins.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/theora_image_transport")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/theora_image_transport")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/environment" TYPE FILE FILES "/opt/ros/foxy/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/environment" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/environment" TYPE FILE FILES "/opt/ros/foxy/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/environment" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_index/share/ament_index/resource_index/packages/theora_image_transport")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/image_transport__pluginlib__plugin" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_index/share/ament_index/resource_index/image_transport__pluginlib__plugin/theora_image_transport")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cExport.cmake"
         "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cExport.cmake"
         "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cExport.cmake"
         "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cppExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cppExport.cmake"
         "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cppExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cppExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cppExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_generator_cppExport.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cppExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cppExport.cmake"
         "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cppExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cppExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cppExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cppExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_introspection_cppExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cppExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cppExport.cmake"
         "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cppExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cppExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cppExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cppExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/Export/share/theora_image_transport/cmake/theora_image_transport__rosidl_typesupport_cppExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_cmake/rosidl_cmake-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_export_libraries/ament_cmake_export_libraries-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_export_include_directories/ament_cmake_export_include_directories-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_cmake/rosidl_cmake_export_typesupport_libraries-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/rosidl_cmake/rosidl_cmake_export_typesupport_targets-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport/cmake" TYPE FILE FILES
    "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_core/theora_image_transportConfig.cmake"
    "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/ament_cmake_core/theora_image_transportConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/theora_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport/package.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/theora_image_transport__py/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
