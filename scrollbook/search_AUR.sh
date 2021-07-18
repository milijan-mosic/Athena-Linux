#!/bin/bash




echo "Yay package name:"
read packagename
echo -e "\n\n"
yay -Ss $packagename
echo -e "\n\n"
