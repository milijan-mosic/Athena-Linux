#!/bin/bash




timedatectl set-ntp true

sudo pacman -Syu --noconfirm
sudo pacman -Scc --noconfirm
