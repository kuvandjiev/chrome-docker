#!/bin/bash
# run xvfb, window manager and VNC server
./bootstrap.sh &
sleep 5
./run_in_docker.sh
