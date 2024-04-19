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
- _Line Detection,_ I start by looking for edges using the Canny edge detector, then I use the Hough Transform to look for lines that indicate the track's borders.
- _Line Grouping,_ Based on their slopes, these identified lines are further divided into left and right bounds.
- _Circle Fitting,_ To estimate the curvature of the track, I use a least-squares circle-fitting method to these groups. Here, minimizing the subsequent objective function is the goal:

<div align="center">
	<img src="https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/c4aeb8f3-b2c5-4aff-a8c5-0f3fe73aad47">
</div>

Where _`(a,b)`_ represents the center of the circle and _`r`_ its radius. The curvature _`k`_ is then calculated as _`k = 1/r`_. The calculated curvature directly informs the steering adjustments needed.
There will be some false positives.
## Recovery Mechanism
I've set up a recovery mechanism in case the car loses sight of the lane lines in order to guarantee more consistency.
- _Loss of Line Detection_, The car will reverse and shift into neutral steering to reposition itself for improved line vision if it does not identify any lines for more than thirty seconds.
- _Extended Detection Failure_, If lines are not detected for an extended period of time, the vehicle will continue to operate in reverse and in neutral, which will stop it from deviating until lines are detected once more.
<div align="center">
	<img src="https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/09c03251-6df0-4d02-bb0c-398dc59903de">
</div>

## PID Control
For swift and smooth car management, the PID controller is essential.

- _Proportional (P)_, It modifies the steering angle in accordance with the track center deviation.
- _Integral (I)_, This part corrects systematic errors and biases by slowly building up the mistake over time.
- _Derivative (D)_, It helps to minimize overshooting and provide a stable driving by moderating the steering response by taking the rate of error change into account.

## Enhancements in Image Processing
_HSV Range Adjustment_, I dynamically modify the HSV color ranges to provide consistent track detection in a variety of lighting conditions.

_Morphological Operations_, I use morphological operations to clean up the image, lowering noise and enhancing the visibility of the identified lines, after isolating the track using a color mask.
## Architecture 
![ARC_ROS2_Architecture drawio (1) (1) drawio](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/4f6400e6-4d23-487b-a9e1-0305d7c0a588)

The ARC-1.0 system is an architecture designed specifically for autonomous rc cars that makes use of ROS2 Foxy for communication and control. There are two main levels in this design: the Hardware Layer, which works directly with the physical components to initiate actions, and the System Layer, which handles control inputs and coordinates the navigation logic of the car.

Control inputs at the System Layer can come from an autonomous algorithm that chooses the vehicle's route and maneuvers, or they can come from manually publishing commands. The Ackermann Steering Controller receives these inputs and interprets them into directives. It then uses these directives to calculate the proper wheel speeds and steering angles.

The `/ackermann_cmd` topic receives steering signals in a standardized message format that is specified by ROS2. Data like the intended speed, steering angle, and acceleration are included in this message. The Ackermann Steering Controller node receives these messages as they are published, analyzes the commands, and determines the required output signals to accomplish the motion that is wanted.

The real physical control of the car happens at the Hardware Layer. It is made up of motor drivers that communicate with the actuators of the car. One essential element that manages the brushless motors and controls their speed based on commands from the System Layer is the vesc driver.

The servo motor driver adjusts the steering mechanism to the proper angle once the vesc driver receives a steering instruction from the `/ackermann_cmd` topic. These electrical signals govern the wheel speed. The car is able to precisely follow the intended trajectory because to its steering and speed control.

The absence of LiDAR and a complete Navigation2 stack, which are frequently seen in autonomous cars for navigation and obstacle avoidance, significantly simplifies the system. Actually, the architecture is made to work with other sensors or in controlled circumstances where complicated navigational tools like these are not needed.

# Software
| Software  | Purpose |
| ------------- | ------------- 
| Ubuntu 20.04  | Operating System for both the on-board (RPi) and off-board(laptop) machines  |
| ROS2 Foxy  |  Acts as middleware for communication and development |
| Gazebo (not implemented yet) |  Realistic environment for testing and simulating sensors used in the racing cars. Also tests racing strategies, decision-making, and algorithms |
| OpenCV | Open-source computer vision and machine learning software library |
| NumPy  | Library for scientific computing with Python. Support for large, multi-dimensional arrays and matrices |
| SciPy  | Built on top of NumPy, functionalities include optimization, regression, interpolation, etc. |
| cv_bridge | ROS library that provides an interface between ROS and OpenCV |

# Hardware
| Hardware  | Purpose |
| ------------- |------------- |
| Raspberry Pi 4B 8GB RAM  | Minicomputer to run nodes, scripts, and etc. |
| 20kg Servo Steer  | For steering the car |
| TT-02 Type-S Chassis  | The load-bearing framework of the car |
| HOBBYWING Sensored Brushless Motor  | Sensored motor for car, connects to VESC |
| VESC 6 MkVI | Controls and regulates the speed of the electric motor. Customizable firmware, regenerative braking, and real-time telemetry |
| Traxxas 4000mah 11.1v 3-Cell 25C  | Battery to power VESC |
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



