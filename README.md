## After booting from USB
        Make sure you are connected to internet (via LAN cable preferred) since using 'iwctl' is not easy for normal users. Or give it a try :)

        > sudo pacman -Sy git glibc --noconfirm
        > git clone https://tinyurl.com/athenaOS
        > bash /Athena-Linux/invoke.sh



## After arch-chroot /mnt (installation will stop, you'll see)
        > bash /Athena-Linux/summon.sh



## Finish installation
        > exit
        > umount -R /mnt
        > reboot






## When entering for the first time as a new user



#### Open Alacritty and run
        > deploy






## Notes:
        These scripts are installing GPT partition table scheme, on both UEFI and BIOS motherboards.

        Filesystem: ext4. Currently without Encryption nor LVM.

        Desktop Environment: LXQT, because it's lightweight DE.
        
        This 'rice' is designed with two things in mind: No Windows/MacOS apps (therefore no wine package) + No dual boot. If you want to learn Linux you need to burn the bridges behind you and go in adventure!

        It installs some graphics drivers depending on choice you make in installer but it might won't work for all graphics cards. Make sure you're running proper drivers, thus consult with ArchWiki. You have to remove bad ones and install good ones manually. You can find installed drivers in '/etc/scrollbook/32bit.sh'. (Had problems with Xorg with nVidia drivers sooooo yeah...)

        My preferred text editor is vim. If you like any other editor, open those files with it.

        You will have awesome list of apps available; out of the box experience. Rice it on your own liking. I've done this setup so my friends and family can have basic OS for everyday use.

        This repo will continue down the path of creating Serbian Linux distro. Fork it if you want to create something else :)
