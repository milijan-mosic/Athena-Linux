#!/bin/bash




gpu_choice=$(</note/gpu_choice.txt)


musthave="lib32-libxinerama" # lib32-mesa-vdpau


if [ $gpu_choice == 0 ]
then
        drivers=" lib32-amdvlk lib32-vulkan-radeon"                   # AMD
        packagelist="$musthave$drivers"
fi

if [ $gpu_choice == 1 ]
then
        drivers=" lib32-vulkan-intel lib32-vulkan-icd-loader"         # Intel
        packagelist="$musthave$drivers"
fi

if [ $gpu_choice == 2 ]
then
        drivers=" lib32-nvidia-utils"                                 # nVidia
        packagelist="$musthave$drivers"
fi


pacman -S $packagelist --noconfirm
