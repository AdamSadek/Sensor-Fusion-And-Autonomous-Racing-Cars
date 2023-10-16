"""
Adam Sadek
Real-time camera view test script

This code displays live video from the camera and exits when stopped by the letter 'q'.
"""
import cv2

# setting video capture, we use 0 as thats where the pi camera index
video_capture = cv2.VideoCapture(0)

while True:
    # storing frame data in the frame variable
    frame = video_capture.read()

    # displaying the frame
    cv2.imshow("Pi-Cam View", frame)

    # Press the 'q' key to exit the loop
    if cv2.waitKey(1) == ord("q"):
        break

# close the video capture and windows when we're done
video_capture.release()
cv2.destroyAllWindows()
