### Notes:
        Those scripts are installing GPT partition table scheme.

        Filesystem: ext4. Currently without Encryption nor LVM.

        Desktop Environment: LXQT, because it's lightweight DE.

        It installs some graphics drivers depending on choice you make in installer but it might won't work for all graphics cards. Make sure you're running proper drivers. You have to remove bad ones and install good ones manually. (You can find installed drivers in /scrollbook/32bit.sh)

        If you don't want any human interactions between calling out scripts "invoke.sh" and "summon.sh", format SSD/Hard disk before doing anything else. Delete all partitions on it.
                e.g. ---> fdisk /dev/sda
                commands: 
                        p - print partition table,
                        d - delete partition,
                        w - write to disk.
        I'm working on a solution where this will be done automatically too!
        
        You will have awesome list of apps available; out of the box experience. Rice it on your own liking. I've done this setup so my friends and family can have basic OS for everyday use.

        This repo will continue down the path of creating Serbian Linux distro. Fork it if you want to create something else :)

        Want to help out? Check out "to do.txt" file.

## After booting from USB (works for both EFI and BIOS motherboards)
        Make sure you are connected to internet (via LAN cable preferred)

        sudo pacman -Sy git --noconfirm
        git clone https://github.com/windwalk-bushido/Atina.git
        bash /Atina/invoke.sh

## After arch-chroot /mnt (it will stop, you'll see)
        bash /Atina/summon.sh

## Change bootloader menu screentime (timeout from '5' to '0.1' seconds)
        vim /boot/grub/grub.cfg

## Finish installation
        exit
        umount -R /mnt
        reboot

## When entering for the first time as new user

#### Change password for a new user (default is the same password you entered for root)
        passwd username

#### If you want, you can setup a set of folders
        bash ~/Atina/scrollbook/deploy-folders.sh

#### Change your timezone (default is Europe/Belgrade)
        ln -sf /usr/share/zoneinfo/X/Y /etc/localtime
        timedatectl set-timezone X/Y

        Where X is continent, Y is town.

#### Change the name of PC/Laptop (default is 'voidbox')
        vim /etc/hostname
        vim /etc/hosts

        Change 'voidbox' to desired hostname in both files.

#### Change volumes for devices
        alsamixer

        After setting everything up, type:
        sudo alsactl store