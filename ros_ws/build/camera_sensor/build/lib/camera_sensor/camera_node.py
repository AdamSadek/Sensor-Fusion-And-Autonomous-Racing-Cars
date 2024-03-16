from flask import Flask, Response
import cv2
import rclpy
from rclpy.node import Node

app = Flask(__name__)

class CameraNode(Node):
    def __init__(self):
        super().__init__('camera_node')
        self.video_capture = cv2.VideoCapture(0)

    def get_frame(self):
        ret, frame = self.video_capture.read()
        if not ret:
            print("Failed to grab frame")
            return None
        return cv2.imencode('.jpg', frame)[1].tobytes()

camera_node = None

def generate_frames():
    global camera_node
    while True:
        frame = camera_node.get_frame()
        if frame is not None:
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

@app.route('/video_feed')
def video_feed():
    return Response(generate_frames(), mimetype='multipart/x-mixed-replace; boundary=frame')

def main():
    rclpy.init(args=None)
    global camera_node
    camera_node = CameraNode()

    app.run(host='localhost', port=5000, threaded=True, use_reloader=False)

    rclpy.shutdown()

if __name__ == '__main__':
    main()
