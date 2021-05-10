#!/bin/bash




echo " " ; echo "Deploying folders..." ; echo " "

timedatectl set-ntp true

cd ~/
rm -r Public
rm -r Templates

echo "Done." ; echo " "

# Should I do this in Plasma DE?
