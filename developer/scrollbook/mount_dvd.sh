#!/bin/bash




echo -e "\nMounting..."
mkdir MOUNTPOINT
sudo mount -o loop /dev/sr0 ~/MOUNTPOINT/ ; echo -e "DONE!\n\n"
