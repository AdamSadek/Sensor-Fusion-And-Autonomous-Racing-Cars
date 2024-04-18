# Sensor Fusion And Autonomous Racing Cars
![ezgif com-resize](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/9aeda5f8-864c-4983-8ee9-5f184e75fa5e)

# Table of Contents
- [About](#about)
- [Software](#software)
- [Hardware](#demos)
- [Test Track](#track)
  - [Testing](#testing)
  
# About
In this project, PID control and image processing methods are used to create an autonomous racing vehicle control system. The system reads real-time video inputs to identify track boundaries and dynamically compute steering adjustments, all while utilizing the ROS 2 Foxy framework. Key responsibilities include using morphological processes to improve picture quality for line recognition and adjusting HSV color (green) ranges to different light levels for reliable track detection.

Based on the perceived deviation from the track center, a PID controller determines the required steering changes, combining error integration and distinction for responsive and smooth vehicle control. In order to dynamically modify the car's speed for the best possible racing performance, the system also computes the track's curvature based on lines that are identified.

## ARC-1.0 Archetecture 
![ARC_ROS2_Architecture drawio (1) (1) drawio](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/4f6400e6-4d23-487b-a9e1-0305d7c0a588)


# Software
| Software  | Purpose |
| ------------- | ------------- 
| Ubuntu 20.04  | Operating System for both the on-board (RPi) and off-board(laptop) machines  |
| ROS2 Foxy  |  Acts as middleware for communication and development |
| Gazebo (not implemented yet) |  Realistic environment for testing and simulating sensors used in the racing cars. Also tests racing strategies, decision-making, and algorithms |
| OpenCV (Open Source Computer Vision Library) | Open-source computer vision and machine learning software library |

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


