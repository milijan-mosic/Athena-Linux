#!/bin/bash

sudo pacman -S lib32-alsa-plugins lib32-libpulse lib32-openal libunrar lib32-libxinerama lib32-mesa --noconfirm
# GPU > Intel: lib32-vulkan-intel, AMD: lib32-amdvlk lib32-vulkan-radeon, nVidia: lib32-nvidia-utils.