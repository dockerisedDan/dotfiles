#!/bin/bash

v4l2-ctl -d /dev/video4 --set-ctrl=zoom_absolute=150
v4l2-ctl -d /dev/video4 --set-ctrl=pan_absolute=18000
v4l2-ctl -d /dev/video4 --set-ctrl=exposure_dynamic_framerate=0
v4l2-ctl -d /dev/video4 --set-ctrl=auto_exposure=0
v4l2-ctl -d /dev/video4 --set-ctrl=focus_automatic_continuous=0
