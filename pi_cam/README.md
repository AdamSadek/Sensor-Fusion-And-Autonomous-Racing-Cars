# Camera Sensor
| File  | Purpose |
| ------------- | ------------- |
| camera_realtime_test.py  | Used to test the Pi-Camera in real-time |
| camera_snap_test.sh  | A bash script that takes a snapshot using the camera |
| opencv_installation.sh  | A bash script to install and build opencv using make |
| pi_cam_setup.sh  | A bash script to install some necassary packages for Pi-Camera |

# Camera Setup

1. Depending on what you have setup already, in your on-board machine (RPi), I suggest running `pi_cam_setup.sh` & `opencv_installation.sh` prior to executing any camera-related tests or programs
2. Once you've installed some necessary packages, go ahead and test both scripts:
  - `camera_snap_test.sh`: Should save an image locally called `test.jpg` with a picture from the camera connected to the pi.
  - `camera_realtime_test.py`: Should display a window frame with a live video from the Pi-Camera.
