## After booting from USB

        Make sure you are connected to internet via RJ-45 (LAN) cable.

        > sudo pacman -Sy git glibc --noconfirm
        > git clone https://tinyurl.com/Athena-Linux
        > bash /Athena-Linux/1.sh

## After installation script enters OS (installation will stop, you'll see)

        > bash /Athena-Linux/2.sh

## Finish installation

        > exit
        > umount -R /mnt
        > reboot

## When entering for the first time as a new user

        Open Alacritty app
        > install_programs

## Notes:

        These scripts are installing GPT partition table scheme, on both UEFI and BIOS motherboards.

        Filesystem: ext4. Currently without Encryption nor LVM.

        Desktop Environment: KDE Plasma - the best looking DE on the planet.

        This 'rice' is designed with two things in mind: No Windows/MacOS apps (therefore no wine package) + No dual boot. If you want to learn Linux you need to burn the bridges behind you and go in adventure!

        It installs some graphics drivers depending on choice you make in installer but it might won't work for all graphics cards. Make sure you're running proper drivers, thus consult with ArchWiki. You have to remove bad ones and install good ones manually. You can find installed drivers in '/etc/scrollbook/32bit.sh'. (Had problems with Xorg with nVidia drivers sooooo yeah...)

        You will have awesome list of apps available; out of the box experience. Rice it on your own liking. I've done this setup so my friends and family can have basic OS for everyday use.

        This repo will continue down the path of creating Serbian Linux distro. Fork it if you want to create something else :)
