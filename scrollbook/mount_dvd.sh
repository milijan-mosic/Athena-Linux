#!/bin/bash




mkdir MOUNTPOINT
echo -e "\nMounting..."
sudo mount -o loop /dev/sr0 ~/MOUNTPOINT/ ; echo -e "DONE!\n\n"
