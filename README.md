## After booting from USB
        Make sure you are connected to internet (via LAN cable preferred) since using 'iwctl' is not easy for normal users. Or give it a try :)

        > sudo pacman -Sy git glibc --noconfirm
        > git clone https://github.com/windwalk-bushido/Athena-Linux.git
        > bash /Atina/invoke.sh



## After arch-chroot /mnt (installation will stop, you'll see)
        > bash /Atina/summon.sh



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

        It installs some graphics drivers depending on choice you make in installer but it might won't work for all graphics cards. Make sure you're running proper drivers, thus consult with ArchWiki. You have to remove bad ones and install good ones manually. You can find installed drivers in '~/.atina/scrollbook/32bit.sh'. (Had problems with Xorg with nVidia drivers sooooo yeah...)

        My preferred text editor is vim. If you like any other editor, open those files with it.

        If you don't want any human interactions between running scripts "invoke.sh" and "summon.sh", format SSD/Hard disk before doing anything else. Delete all partitions on it. *Also, make a new GPT table scheme if there's none. Then reboot system and start installation again.
                e.g. ---> fdisk /dev/sda
                commands: 
                        p - print partition table scheme,
                        d - delete partition,
                        g - new GPT scheme,
                        w - write to disk.
        I'm working on a solution where this will be done automatically!
        * It still can ask you for confirming that you want to format certain partitions to ext4... unfortunately. Type 'y' and hit 'Enter' and you're good to go. It's early in the installation process so it's advised for you to stay looking at screen from 10 to 30 seconds after you entered all required info (after running 'bash Atina/invoke.sh' command ofcourse).

        You will have awesome list of apps available; out of the box experience. Rice it on your own liking. I've done this setup so my friends and family can have basic OS for everyday use.

        This repo will continue down the path of creating Serbian Linux distro. Fork it if you want to create something else :)
