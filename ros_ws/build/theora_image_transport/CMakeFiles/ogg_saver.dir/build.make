# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport

# Include any dependencies generated for this target.
include CMakeFiles/ogg_saver.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ogg_saver.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ogg_saver.dir/flags.make

CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.o: CMakeFiles/ogg_saver.dir/flags.make
CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.o: /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport/src/ogg_saver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.o -c /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport/src/ogg_saver.cpp

CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport/src/ogg_saver.cpp > CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.i

CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport/src/ogg_saver.cpp -o CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.s

# Object files for target ogg_saver
ogg_saver_OBJECTS = \
"CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.o"

# External object files for target ogg_saver
ogg_saver_EXTERNAL_OBJECTS =

ogg_saver: CMakeFiles/ogg_saver.dir/src/ogg_saver.cpp.o
ogg_saver: CMakeFiles/ogg_saver.dir/build.make
ogg_saver: /usr/local/lib/libopencv_gapi.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_highgui.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_ml.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_objdetect.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_photo.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_stitching.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_video.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_videoio.so.4.8.0
ogg_saver: /opt/ros/foxy/lib/librclcpp.so
ogg_saver: libtheora_image_transport__rosidl_typesupport_cpp.so
ogg_saver: /usr/local/lib/libopencv_imgcodecs.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_dnn.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_calib3d.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_features2d.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_flann.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_imgproc.so.4.8.0
ogg_saver: /usr/local/lib/libopencv_core.so.4.8.0
ogg_saver: /opt/ros/foxy/lib/liblibstatistics_collector.so
ogg_saver: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_introspection_c.so
ogg_saver: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_generator_c.so
ogg_saver: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_c.so
ogg_saver: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_introspection_cpp.so
ogg_saver: /opt/ros/foxy/lib/liblibstatistics_collector_test_msgs__rosidl_typesupport_cpp.so
ogg_saver: /opt/ros/foxy/lib/librcl.so
ogg_saver: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_introspection_c.so
ogg_saver: /opt/ros/foxy/lib/librcl_interfaces__rosidl_generator_c.so
ogg_saver: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_c.so
ogg_saver: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_introspection_cpp.so
ogg_saver: /opt/ros/foxy/lib/librcl_interfaces__rosidl_typesupport_cpp.so
ogg_saver: /opt/ros/foxy/lib/librmw_implementation.so
ogg_saver: /opt/ros/foxy/lib/librmw.so
ogg_saver: /opt/ros/foxy/lib/librcl_logging_spdlog.so
ogg_saver: /usr/lib/aarch64-linux-gnu/libspdlog.so.1.5.0
ogg_saver: /opt/ros/foxy/lib/librcl_yaml_param_parser.so
ogg_saver: /opt/ros/foxy/lib/libyaml.so
ogg_saver: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_introspection_c.so
ogg_saver: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_generator_c.so
ogg_saver: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_c.so
ogg_saver: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_introspection_cpp.so
ogg_saver: /opt/ros/foxy/lib/librosgraph_msgs__rosidl_typesupport_cpp.so
ogg_saver: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_introspection_c.so
ogg_saver: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_generator_c.so
ogg_saver: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_c.so
ogg_saver: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_introspection_cpp.so
ogg_saver: /opt/ros/foxy/lib/libstatistics_msgs__rosidl_typesupport_cpp.so
ogg_saver: /opt/ros/foxy/lib/libtracetools.so
ogg_saver: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_introspection_c.so
ogg_saver: /opt/ros/foxy/lib/libsensor_msgs__rosidl_generator_c.so
ogg_saver: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_c.so
ogg_saver: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_introspection_cpp.so
ogg_saver: /opt/ros/foxy/lib/libsensor_msgs__rosidl_typesupport_cpp.so
ogg_saver: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_introspection_c.so
ogg_saver: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_generator_c.so
ogg_saver: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_c.so
ogg_saver: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_introspection_cpp.so
ogg_saver: /opt/ros/foxy/lib/libgeometry_msgs__rosidl_typesupport_cpp.so
ogg_saver: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_introspection_c.so
ogg_saver: /opt/ros/foxy/lib/libstd_msgs__rosidl_generator_c.so
ogg_saver: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_c.so
ogg_saver: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_introspection_cpp.so
ogg_saver: /opt/ros/foxy/lib/libstd_msgs__rosidl_typesupport_cpp.so
ogg_saver: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_c.so
ogg_saver: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_generator_c.so
ogg_saver: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_c.so
ogg_saver: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_cpp.so
ogg_saver: /opt/ros/foxy/lib/librosidl_typesupport_introspection_cpp.so
ogg_saver: /opt/ros/foxy/lib/librosidl_typesupport_introspection_c.so
ogg_saver: /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_cpp.so
ogg_saver: /opt/ros/foxy/lib/librosidl_typesupport_cpp.so
ogg_saver: /opt/ros/foxy/lib/librosidl_typesupport_c.so
ogg_saver: /opt/ros/foxy/lib/librcpputils.so
ogg_saver: /opt/ros/foxy/lib/librosidl_runtime_c.so
ogg_saver: /opt/ros/foxy/lib/librcutils.so
ogg_saver: CMakeFiles/ogg_saver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ogg_saver"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ogg_saver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ogg_saver.dir/build: ogg_saver

.PHONY : CMakeFiles/ogg_saver.dir/build

CMakeFiles/ogg_saver.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ogg_saver.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ogg_saver.dir/clean

CMakeFiles/ogg_saver.dir/depend:
	cd /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/src/image_transport_plugins/theora_image_transport /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport /home/adam/Sensor-Fusion-And-Autonomous-Racing-Cars/ros_ws/build/theora_image_transport/CMakeFiles/ogg_saver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ogg_saver.dir/depend

