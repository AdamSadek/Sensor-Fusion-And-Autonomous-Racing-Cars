# Sensor Fusion And Autonomous Racing Cars
![ezgif com-resize](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/9aeda5f8-864c-4983-8ee9-5f184e75fa5e)

# Table of Contents
- [About](#about)
  - [ARC-1.0 Architecture](#architecture)
- [Software](#software)
- [Hardware](#demos)
- [Detailed Overview](#detailed-overview-of-technical-implementations)
  - [Curvature Calculation](#curvature-calculation)
  - [Recovery Mechanism](#recovery-mechanism)
  - [PID Control](#pid-control)
  - [Enhancements in Image Processing](#enhancements-in-image-processing)
- [Test Track](#track)
  - [Testing](#testing)
  
# About
In this project, PID control and image processing methods are used to create an autonomous racing vehicle control system. The system reads real-time video inputs to identify track boundaries and dynamically compute steering adjustments, all while utilizing the ROS 2 Foxy framework. Key responsibilities include using morphological processes to improve picture quality for line recognition and adjusting HSV color (green) ranges to different light levels for reliable track detection.

Based on the perceived deviation from the track center, a PID controller determines the required steering changes, combining error integration and distinction for responsive and smooth vehicle control. In order to dynamically modify the car's speed for the best possible racing performance, the system also computes the track's curvature based on lines that are identified.

# Detailed Overview of Technical Implementations
## Curvature Calculation
Determining the curvature of the track properly is essential for efficient navigation. My methodology includes:
<div align="center">
	<h4>Curvature Calculation</h4>
	<img src="https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/42a7c943-3b54-40eb-9d7f-09bc1d7fb9a1">
</div>

- _Line Detection,_ I start by looking for edges using the Canny edge detector, then I use the Hough Transform to look for lines that indicate the track's borders.
- _Line Grouping,_ Based on their slopes, these identified lines are further divided into left and right bounds.
- _Circle Fitting,_ To estimate the curvature of the track, I use a least-squares circle-fitting method to these groups. Here, minimizing the subsequent objective function is the goal:
<div align="center">
    <h4>Calculating Radius with Euclidean Distance</h4>
    <img src="https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/9067bf0d-4114-4c30-8e73-2ff80e5790d8">
</div>

Where _`(a,b)`_ represents the center of the circle and _`r`_ its radius. The curvature _`k`_ is then calculated as _`k = 1/r`_. The calculated curvature directly informs the steering adjustments needed.
There will be some false positives.
## Recovery Mechanism
I've set up a recovery mechanism in case the car loses sight of the lane lines in order to guarantee more consistency. One of the main reasons for the car leaving the track are the camera angle, field of view (FOV), and poor camera quality. (this will be fixed in a future release)
- _Loss of Line Detection_, The car will reverse and shift into neutral steering to reposition itself for improved line vision if it does not identify any lines for more than thirty seconds.
- _Extended Detection Failure_, If lines are not detected for an extended period of time, the vehicle will continue to operate in reverse and in neutral, which will stop it from deviating until lines are detected once more.
<div align="center">
	<h4>Recovery Mechanism</h4>
	<img src="https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/09c03251-6df0-4d02-bb0c-398dc59903de">
</div>

## PID Control
For swift and smooth car management, the PID controller is essential.

- _Proportional **(P)**_, It modifies the steering angle in accordance with the track center deviation.
- _Integral **(I)**_, This part corrects systematic errors and biases by slowly building up the mistake over time.
- _Derivative **(D)**_, It helps to minimize overshooting and provide a stable driving by moderating the steering response by taking the rate of error change into account.

### Computing Correction
This happens based on the current error and delta time. Applying the PID formula for the correction value.
<div align="center">
	<h4>Correction Calculation</h4>
	<img src="https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/bc752c33-8363-431a-8868-b5e84ab40ca2">
</div>

## Enhancements in Image Processing
<div align="center">
	<h4>Image Processing Pipeline</h4>
	<img src="https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/e6f69f41-873c-4fc1-aeaa-af8c98430363" alt="Pipeline" width="1080"/>
</div>

The car's ability to navigate autonomously relies largely on the _`process_image`_ function. The region of interest _(ROI)_, which is the track ahead, is first divided into sections at the bottom of the frame. This subset, taken by the car's camera, is critical since it contains the lines that control the steering logic.

After that, the ROI is changed to the HSV color space, which is preferable to the usual BGR color system used in photos for color recognition in an array of lighting conditions. The transformation is shown by two sample images above, one shows a straight path, while the other shows a curve in the track.

Once the HSV conversion is finished, the track lines color, typically green, is separated using a color mask. To suit changing lighting settings, the precise range of green is dynamically modified based on the overall brightness of the image. For debugging reasons, the generated binary mask clearly separates the track lines, as shown in the 'mask.jpg'.

The mask is tested with _morphological processes_ in order to eliminate small noise and refine the picture, ensuring that the edge detection process that follows will only target important features. 'edges.jpg' is the outcome of applying the Canny edge detection method on this cleaned mask. It shows the sharp transitions from the track line to the surrounding area.

Ultimately, these edges are converted into line segments by using the _HoughLinesP_ algorithm. The linear patterns in the edge-detected image can be easily found by this mathematical approach, which can then convert the patterns into a set of line coordinates. The car's steering logic depends on these positions in order to understand the path's structure and modify the steering as needed. The photos that have been analyzed and lines that have been identified are stored for future validation and debugging.

## Architecture 
<div align="center">
	<h4>ARC-1.0 Design</h4>
</div>

![ARC_ROS2_Architecture drawio (1) (1) drawio](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/4f6400e6-4d23-487b-a9e1-0305d7c0a588)

The ARC-1.0 system is an architecture designed specifically for autonomous rc cars that makes use of ROS2 Foxy for communication and control. There are two main levels in this design: the Hardware Layer, which works directly with the physical components to initiate actions, and the System Layer, which handles control inputs and coordinates the navigation logic of the car.

Control inputs at the System Layer can come from an autonomous algorithm that chooses the vehicle's route and maneuvers, or they can come from manually publishing commands. The Ackermann Steering Controller receives these inputs and interprets them into directives. It then uses these directives to calculate the proper wheel speeds and steering angles.

The `/ackermann_cmd` topic receives steering signals in a standardized message format that is specified by ROS2. Data like the intended speed, steering angle, and acceleration are included in this message. The Ackermann Steering Controller node receives these messages as they are published, analyzes the commands, and determines the required output signals to accomplish the motion that is wanted.

The real physical control of the car happens at the Hardware Layer. It is made up of motor drivers that communicate with the actuators of the car. One essential element that manages the brushless motors and controls their speed based on commands from the System Layer is the vesc driver.

The servo motor driver adjusts the steering mechanism to the proper angle once the vesc driver receives a steering instruction from the `/ackermann_cmd` topic. These electrical signals govern the wheel speed. The car is able to precisely follow the intended trajectory because to its steering and speed control.

The absence of LiDAR and a complete Navigation2 stack, which are usually seen in autonomous cars for navigation and obstacle avoidance, significantly simplifies the system. Actually, the architecture is made to work with other sensors or in controlled circumstances where complicated navigational tools like these are not needed.

# Software
| Software  | Purpose |
| ------------- | ------------- 
| Ubuntu 20.04  | Operating System for both the on-board (RPi) and off-board(laptop) machines  |
| ROS2 Foxy  |  Acts as middleware for communication and development |
| Gazebo (not implemented yet) |  Realistic environment for testing and simulating sensors used in the racing cars. Also tests racing strategies, decision-making, and algorithms |
| Python3 | Programming language used in this project |
| OpenCV | Open-source computer vision and machine learning software library |
| NumPy  | Library for scientific computing with Python. Support for large, multi-dimensional arrays and matrices |
| SciPy (not using) | Built on top of NumPy, functionalities include optimization, regression, interpolation, etc. |
| cv_bridge | ROS library that provides an interface between ROS and OpenCV |

# Hardware
| Hardware  | Purpose |
| ------------- |------------- |
| Raspberry Pi 4B 8GB RAM  | Minicomputer to run nodes, scripts, and etc. |
| 20kg Servo Steer  | For steering the car |
| TT-02 Type-S Chassis  | The load-bearing framework of the car |
| HOBBYWING Sensored Brushless Motor  | Sensored motor for car, connects to VESC |
| VESC 6 MkVI | Controls and regulates the speed of the electric motor. Customizable firmware, regenerative braking, and real-time telemetry |
| Traxxas 4000mAh 11.1v 3-Cell 25C  | Battery to power VESC |
| Power Bank  | To power RPi when mobile - stores up to 42800mAh |
| Logitech C270  | Captures images for obstacle detection, lane following, and AI |
| 2D LiDAR (not using)  | Scans surroundings, detecting obstacles, navigation support, and path planning |

# Demos
| Clips  | Description |
| ------------- | ------------- |
| [![Car Build Video](![mqdefault](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/4c08f80f-34f9-4850-88e9-0ad59b88d994))](https://youtu.be/HKNmzNzHUgk "RC Car build - draft") | Car Build (no upgrades)|
| [![ARC Drive On Test Track](![mqdefault](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/4c08f80f-34f9-4850-88e9-0ad59b88d994))](https://youtube.com/shorts/8xFkLMT-zEQ "ARC Testing") | Car performing two laps |

# Track
![track 2](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/dd0e4900-3f3f-45f8-9aab-329af0c4810f)


## Testing
A realistic verification test was conducted to make sure the movement commands given to the car were executed accurately. In order to verify the car's speed, a two-meter strip of tape was placed on the ground. The car was seen to cross the two-meter distance by posting data to the `/ackermann_cmd` topic, indicating that the speed commands were correctly transmitted as the car stopped the motor at the two-meter mark. Also, the degree to which the vehicle steers its trajectory in response to commands was also used to assess the effectiveness of the steering system. This careful testing approach guarantees that the vehicle's control system translates the command signals into the appropriate physical actions.

![carmovingnexttotape-ezgif com-crop](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/ae3d1d1e-b1ae-41e7-8536-679b17d441df)



