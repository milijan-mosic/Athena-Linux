#!/bin/bash

gpu_choice=$(</note/gpu_choice.txt)

musthave="lib32-alsa-plugins lib32-libpulse lib32-openal libunrar lib32-libxinerama lib32-mesa"

if [ $gpu_choice == 0 ]
then
        drivers=" lib32-amdvlk lib32-vulkan-radeon"     # AMD
        packagelist="$musthave$drivers"
else
        something=1
fi

if [ $gpu_choice == 1 ]
then
        drivers=" lib32-vulkan-intel"                   # Intel
        packagelist="$musthave$drivers"
else
        something=1
fi

if [ $gpu_choice == 2 ]
then
        drivers=" lib32-nvidia-utils"                   # nVidia
        packagelist="$musthave$drivers"
else
        something=1
fi

sudo pacman -S $packagelist --noconfirm
