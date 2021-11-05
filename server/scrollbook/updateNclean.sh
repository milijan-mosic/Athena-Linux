#!/bin/bash




echo -e "\n\n### UPDATING MIRROR LIST... ###\n"
sudo reflector --latest 24 --sort rate --save /etc/pacman.d/mirrorlist
echo -e "\n### DONE ###"




echo -e "\n\n### UPDATING HOST FILE URLS... ###\n"
sudo rm /etc/hosts
sudo wget -P /etc/ https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
echo -e "\n### DONE ###"




echo -e "\n\n### UPDATING SYSTEM... ###\n"
sudo pacman -Syu --noconfirm
echo -e "\n### DONE ###"

echo -e "\n\n### DELETING PACKAGE MANAGER'S CACHE... ###\n"
sudo pacman -Scc --noconfirm
paru -Scc --noconfirm
echo -e "\n### DONE ###\n\n"
