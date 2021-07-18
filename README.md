## After booting from USB

Make sure you are connected to internet via RJ-45 (LAN) cable.

Enter following commands:

        > sudo pacman -Sy git --noconfirm
        > git clone https://tinyurl.com/Athena-Linux
        > bash /Athena-Linux/1.sh

## After installation script enters OS (installation will stop, you'll see)

        > bash /Athena-Linux/2.sh

## Finish installation

        > exit
        > umount -R /mnt
        > reboot

## When entering for the first time as a new user

        > bash normal_installation.sh

Or if you want a advanced build (for developers or advanced linux users) enter:

        > bash superuser_installation.sh

## Notes:

These scripts are installing GPT partition table scheme, on both UEFI and BIOS firmware.
SWAP file size: 8 GB. I think it's enough for all RAM sizes.

Filesystem: ext4. Currently without Encryption nor LVM. 
This means that you can install this OS on only one SSD/hard disk.
In plan: BTRFS + backup file (if system crashes - recovery is easy).

Desktop Environment: KDE Plasma - the best looking DE on the planet.
In plan: making dark MacOS theme default (Apple has such good UI principles).

This OS is designed with two things in mind: No Windows/MacOS apps (therefore no wine package) + No dual boot. 
If you want to learn Linux you need to burn the bridges behind you and go in adventure!

Kid safety + enterprise mindset: it's blocking porn, gambling, fake news, malware and adware websites by default.

It installs some graphics drivers depending on choice you make in installer but it might won't work for all graphics cards. 
Make sure you're running proper drivers, thus consult with ArchWiki. 
You have to remove bad ones and install good ones manually.

You will have awesome list of apps available; out of the box experience. 
Rice it on your own liking. 
I've done this setup so my friends and family can have basic OS for everyday use.

Alacritty + YTDL = download song/video from Youtube without websites/GUI apps. Just type 'audio' or 'video' and paste link.

Timezone is set to Europe/Belgrade by default.
