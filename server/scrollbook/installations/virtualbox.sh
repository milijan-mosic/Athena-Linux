#!/bin/bash




sudo pacman -S virtualbox virtualbox-host-dkms linux-hardened linux-hardened-docs linux-hardened-headers --noconfirm

sudo modprobe vboxdrv
sudo modprobe vboxnetadp
sudo modprobe vboxnetflt

echo -e "\n\n#### DONE ####\n"
