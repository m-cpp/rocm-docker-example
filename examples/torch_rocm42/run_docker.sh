#!/bin/bash
sudo docker run -it --rm --privileged --device=/dev/kfd --device=/dev/dri --shm-size=2gb --group-add video rocm/pytorch:rocm4.2_ubuntu18.04_py3.6_pytorch_1.8.1