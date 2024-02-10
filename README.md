# Sensor Fusion And Autonomous Racing Cars

This project merges sensors such as LiDAR and cameras to provide racing cars with real-time environmental awareness. This improves decision-making, enabling self-driving cars to precisely navigate tracks and maximize efficiency.

# Software
| Software  | Purpose |
| ------------- | ------------- 
| Ubuntu 20.04  | Operating System for both the on-board (RPi) and off-board(laptop) machines  |
| ROS2 Foxy  |  Acts as middleware for communication and development |
| Gazebo (not implemented yet) |  Realistic environment for testing and simulating sensors used in the racing cars. Also tests racing strategies, decision-making, and algorithms |

# Hardware
| Hardware  | Purpose |
| ------------- |------------- |
| Raspberry Pi 4B 8GB RAM  | Minicomputer to run nodes, scripts, and etc. |
| 20kg Servo Steer  | For steering the car |
| TT-02 Type-S Chassis  | The load-bearing framework of the car |
| HOBBYWING Sensored Brushless Motor  | Sensored motor for car, connects to VESC |
| VESC 6 MkVI | Controls and regulates the speed of the electric motor. Customizable firmware, regenerative braking, and real-time telemetry |
| Enrich Power 3000mah 7.2v  | Battery to power Servo/Motor and more |
| Power Bank  | To power RPi when mobile - stores up to 42800mAh |
| Pi Camera Module v2.1  | Captures images for obstacle detection, lane following, and AI |
| 2D LiDAR  | Scans surroundings, detecting obstacles, navigation support, and path planning |

# Demos
| Clips  | Description |
| ------------- | ------------- |
| [![Car Build Video](![mqdefault](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/4c08f80f-34f9-4850-88e9-0ad59b88d994))](https://youtu.be/HKNmzNzHUgk "RC Car build - draft") | Car Build |
|![Motor Test](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/ef310458-f00b-4cdb-8260-ce76fef7c9a9)| Motor Test|
|![servo test](https://github.com/AdamSadek/Sensor-Fusion-And-Autonomous-Racing-Cars/assets/33073174/ac0bdac4-42f2-432f-ad80-0eb25624876c)| Servo (Steering) Test|



