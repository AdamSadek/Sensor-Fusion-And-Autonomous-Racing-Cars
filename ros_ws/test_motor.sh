while true; do
  ros2 topic pub /ackermann_cmd ackermann_msgs/msg/AckermannDrive "{speed: 1.0, steering_angle: 0.0}" --once
  sleep 1 # Adjust the sleep duration to control the frequency of commands
done
