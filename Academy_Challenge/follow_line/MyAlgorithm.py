#!/usr/bin/python
#-*- coding: utf-8 -*-
import threading
import time
from datetime import datetime

import math
import cv2
import numpy as np

time_cycle = 80

class MyAlgorithm(threading.Thread):

    def __init__(self, camera, motors):
        self.camera = camera
        self.motors = motors
        self.threshold_image = np.zeros((640,360,3), np.uint8)
        self.color_image = np.zeros((640,360,3), np.uint8)
        self.stop_event = threading.Event()
        self.kill_event = threading.Event()
        self.lock = threading.Lock()
        self.threshold_image_lock = threading.Lock()
        self.color_image_lock = threading.Lock()
        threading.Thread.__init__(self, args=self.stop_event)
    
    def getImage(self):
        self.lock.acquire()
        img = self.camera.getImage().data
        self.lock.release()
        return img

    def set_color_image (self, image):
        img  = np.copy(image)
        if len(img.shape) == 2:
          img = cv2.cvtColor(img, cv2.COLOR_GRAY2RGB)
        self.color_image_lock.acquire()
        self.color_image = img
        self.color_image_lock.release()
        
    def get_color_image (self):
        self.color_image_lock.acquire()
        img = np.copy(self.color_image)
        self.color_image_lock.release()
        return img
        
    def set_threshold_image (self, image):
        img = np.copy(image)
        if len(img.shape) == 2:
          img = cv2.cvtColor(img, cv2.COLOR_GRAY2RGB)
        self.threshold_image_lock.acquire()
        self.threshold_image = img
        self.threshold_image_lock.release()
        
    def get_threshold_image (self):
        self.threshold_image_lock.acquire()
        img  = np.copy(self.threshold_image)
        self.threshold_image_lock.release()
        return img

    def run (self):

        while (not self.kill_event.is_set()):
            start_time = datetime.now()
            if not self.stop_event.is_set():
                self.algorithm()
            finish_Time = datetime.now()
            dt = finish_Time - start_time
            ms = (dt.days * 24 * 60 * 60 + dt.seconds) * 1000 + dt.microseconds / 1000.0
            #print (ms)
            if (ms < time_cycle):
                time.sleep((time_cycle - ms) / 1000.0)

    def stop (self):
        self.stop_event.set()

    def play (self):
        if self.is_alive():
            self.stop_event.clear()
        else:
            self.start()

    def kill (self):
        self.kill_event.set()

    def algorithm(self):
        def line_detection(img):
            # Convert to Grayscale or HSV
            hsv_img = cv2.cvtColor(img, cv2.COLOR_RGB2HSV)
            lower_bound = (0,0,0)
            higher_bound = (150,150,150)
            mask = cv2.inRange(hsv_img, lower_bound, higher_bound)
            # retval, thresh = cv2.threshold(gray_img, 150, 255, cv2.THRESH_BINARY) # didn't work because of the dark colors of the walls and the line
            return mask

        def crop_image(img):
            # as we will have PID controller, so getting out of the track and many corner cases for the cropped image that will not work, will not happen
            h, w = img.shape[:2]
            new_img = img[h-100:h, 0:w]
            new_img[0:5][:] = 255
            new_img[95:100][:] = 255
            return new_img

        def get_set_point(img):
            _, contours, _ = cv2.findContours(img, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
            cnt = contours[len(contours)-1]
            rect = cv2.minAreaRect(contours[len(contours)-1])
            box = cv2.boxPoints(rect)
            box = np.int0(box)
            M = cv2.moments(cnt)
            cX = int(M["m10"] / M["m00"])
            cY = int(M["m01"] / M["m00"])
            set_point = (cX,cY)
            set_point_image = cv2.circle(img, set_point, 5, (255, 255, 255), -1)
            return set_point, set_point_image

        def control(set_point):
            kp,ki,kd = 10,0,0
            error = math.sqrt((320 - set_point[0])**2 + (50 - set_point[1])**2)
            # self.motors.sendV(1-error)


        #GETTING THE IMAGES
        image = self.getImage()

        # Add your code here
        print "Runing"

        binary_image = line_detection(image)
        cropped_binary_image = crop_image(binary_image)
        set_point, set_point_image = get_set_point(cropped_binary_image)

        control(set_point)
        #EXAMPLE OF HOW TO SEND INFORMATION TO THE ROBOT ACTUATORS
        #self.motors.sendV(10)
        #self.motors.sendW(5)

        #SHOW THE FILTERED IMAGE ON THE GUI
        self.set_threshold_image(set_point_image)
