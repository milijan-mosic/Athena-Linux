#!/bin/bash




echo -e "\nMounting..."
mkdir MNT
sudo mount -o loop /dev/sr0 ~/MNT/
echo -e "DONE!\n\n"
