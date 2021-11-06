#!/bin/bash
sudo docker run -it --privileged --rm --device=/dev/kfd --device=/dev/dri --shm-size=2gb --group-add video rocm/tensorflow:rocm4.2-tf2.3-dev