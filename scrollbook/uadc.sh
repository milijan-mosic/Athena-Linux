#!/bin/bash

sudo pacman -Syy --noconfirm
sudo pacman -Syu --noconfirm
echo " "
sudo pacman -Scc --noconfirm
echo " " ; echo " "