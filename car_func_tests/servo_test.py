"""
Adam Sadek
Servo steering test script

This code tests a servo motor's steering by moving it between two angles (0 and 150 degrees) with a delay,
and it returns the servo to a neutral position when it completes the test 10 times.
"""

import RPi.GPIO as GPIO
import time

# here i'm setting the literal GPIO pin locations to be used
GPIO.setmode(GPIO.BOARD)

# pin number 11 is where i've connected the servo so I need to make it available for signals
GPIO.setup(11,GPIO.OUT)

# here I use Pulse Width Modulation to control the servo
servo = GPIO.PWM(11,50)

# this func steers the servo depending on the angle we provide it
def update_pos(angle):
    # these two values below are commanly used to calculate the duty cycle
    common_scale_factor = 18.0
    min_duty_cycle = 2.5
    # calulating duty cycle and then moving the servo based on it's value
    duty_cycle = min_duty_cycle + (angle / common_scale_factor)
    servo.ChangeDutyCycle(duty_cycle)
    time.sleep(0.5)

# starting the servo at a neutral pos
servo.start(7.1)

# a simple while loop to test the movement from two angles 0-150 deg. Testing it 10 times.
test_count = 0
while test_count != 10:
    update_pos(0)
    time.sleep(1)
    update_pos(150)
    time.sleep(1)
    test_count += 1
    print("Test #", test_count)

# go back to neutral position
servo.ChangeDutyCycle(7.1)
time.sleep(1)

# stopping servo motor and cleaning up the GPIO pins
servo.stop()
GPIO.cleanup()