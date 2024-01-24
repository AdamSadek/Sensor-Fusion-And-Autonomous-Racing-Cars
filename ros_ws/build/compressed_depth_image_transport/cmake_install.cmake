# Install script for directory: /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/compressed_depth_image_transport

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/install/compressed_depth_image_transport")
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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcompressed_depth_image_transport.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcompressed_depth_image_transport.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcompressed_depth_image_transport.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/libcompressed_depth_image_transport.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcompressed_depth_image_transport.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcompressed_depth_image_transport.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcompressed_depth_image_transport.so"
         OLD_RPATH "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/install/image_transport/lib:/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/install/cv_bridge/lib:/opt/ros/foxy/lib:/opt/ros/foxy/lib/aarch64-linux-gnu:/usr/local/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libcompressed_depth_image_transport.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/compressed_depth_image_transport/include/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/compressed_depth_image_transport/compressed_depth_plugins.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/compressed_depth_image_transport")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/compressed_depth_image_transport")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport/environment" TYPE FILE FILES "/opt/ros/foxy/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport/environment" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport/environment" TYPE FILE FILES "/opt/ros/foxy/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport/environment" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_index/share/ament_index/resource_index/packages/compressed_depth_image_transport")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/image_transport__pluginlib__plugin" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_index/share/ament_index/resource_index/image_transport__pluginlib__plugin/compressed_depth_image_transport")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport/cmake" TYPE FILE FILES
    "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_core/compressed_depth_image_transportConfig.cmake"
    "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/ament_cmake_core/compressed_depth_image_transportConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/compressed_depth_image_transport" TYPE FILE FILES "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/compressed_depth_image_transport/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/compressed_depth_image_transport/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
