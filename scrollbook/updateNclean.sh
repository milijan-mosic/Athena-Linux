#!/bin/bash




echo -e "\n\n"
reflector --latest 100 --sort rate --save /etc/pacman.d/mirrorlist

rm /etc/hosts
wget -P /etc/ https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts

echo -e "\n\n"
sudo pacman -Syu --noconfirm

echo -e "\n\n"
sudo pacman -Scc --noconfirm
echo -e "\n\n"
