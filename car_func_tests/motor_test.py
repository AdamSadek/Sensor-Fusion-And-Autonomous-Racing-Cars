"""
Adam Sadek
Motor throttle test script

This code controls/tests the car's motor, making it go from low to high speed and vice versa.
"""

import RPi.GPIO as GPIO
import time

# here i'm setting the literal GPIO pin locations to be used
GPIO.setmode(GPIO.BOARD)

# pin number 13 is where i've connected the motor so I need to make it available for signals
GPIO.setup(13,GPIO.OUT)

# here I use Pulse Width Modulation to control the motor
motor = GPIO.PWM(13, 50)

# starting the car at a low speed
motor.start(0)

test_count = 1
while test_count != 3:
    print("----- Test #{} -----".format(test_count))
    min_speed = 5
    max_speed = 10
    # going from low to high speed
    print("* Low to high speed *")
    for throttle in range(min_speed, max_speed):
        motor.ChangeDutyCycle(throttle)
        time.sleep(1)
        print("Speed: ", throttle)

    # going from high to low speed
    print("* High to low speed *")
    for throttle in range(max_speed, min_speed, -1):
        motor.ChangeDutyCycle(throttle)
        time.sleep(1)
        print("Speed: ", throttle)

    test_count += 1

motor.stop()
GPIO.cleanup()