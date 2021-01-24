## After booting from USB (works for both EFI and BIOS motherboards)
        Make sure you are connected to internet (via LAN cable preferred)

        sudo pacman -Syy git --noconfirm
        git clone https://github.com/windwalk-bushido/Atina.git
        bash /mOS/invoke.sh

## After arch-chroot /mnt (it will stop, you'll see)
        bash /mOS/summon.sh

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
        bash ~/mOS/scrollbook/deploy-folders.sh

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
