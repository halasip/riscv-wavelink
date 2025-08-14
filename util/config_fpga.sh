#!/bin/bash

IP=172.16.220.97
RBF="../build/DE10.rbf"
RBF_HPS="~/sdcard/fpga.rbf"

ssh root@$IP 'mkdir -p sdcard && mount /dev/mmcblk0p1 ~/sdcard'
scp $RBF root@$IP:$RBF_HPS
ssh root@$IP './fpga_config_tool && umount /dev/mmcblk0p1'

