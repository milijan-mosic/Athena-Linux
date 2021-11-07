#!/bin/bash




echo "Enter package/s names:\n>>>"
read packagename
echo -e "\n\n"
sudo pacman -Ss $packagename
echo -e "\n\n"
