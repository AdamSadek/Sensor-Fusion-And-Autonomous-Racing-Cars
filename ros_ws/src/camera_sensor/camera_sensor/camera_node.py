"""
Adam Sadek

This code uses rclpy (ROS Client Library for Python) which is a python library for ROS2.
It helps creatge nodes, publish topics and also subscribing to topics and much more.


"""

import rclpy
from rclpy.node import Node
import cv2

class CameraNode(Node):

    # creating a ROS2 node and naming it 'camera_node'
    def __init__(self):
        # creating the node with the name camera_node
        Node.__init__(self, 'camera_node')

    # function to launch the camera. It's done the same way as my test script.
    def launch_cam(self):
        # opening the camera and storing its instance
        video_capture = cv2.VideoCapture(0)
        while True:
            # storing frame data in the frame variable
            ret, frame = video_capture.read()

            # displaying the frame
            cv2.imshow("Pi-Cam View", frame)

            # Press the 'q' key to exit the loop - uses ASCII value of the key
            if cv2.waitKey(1) == ord("q"):
                break

def main():
    # initilizing ROS2, no arguments for now
    rclpy.init(args=None)

    # here we're just creating an object of the class above "CameraNode" so we can call it later.
    camera_node = CameraNode()

    # calling the function launch_cam to launch the pi-cam
    camera_node.launch_cam()

    # telling ROS to stop and clean up
    rclpy.shutdown()
