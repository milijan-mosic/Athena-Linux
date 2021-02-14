#!/bin/bash

##############
# USER INPUT #
##############

flag=0
clear

while [ $flag == 0 ]
do
        pass=1

        while [ $pass == 1 ]
        do
                echo " " ; lsblk
                echo " " ; echo "Where do you want to install Atina?" ; echo " "
                read ssd

                lenght=${#ssd}

                if [ $lenght != 8 ] || [ -z ssd ]
                then
                        echo " " ; echo "Input is not equal to 8 characters or empty input... try again." ; echo " "
                else
                        pass=0
                fi
        done

        pass=1

        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                ls /sys/firmware/efi/efivars
                echo " " ; echo "Is this an EFI or BIOS motherboard? ('0' for BIOS, '1' for EFI) (If no directory is found, it's BIOS)" ; echo " "
                read efi

                if [ $efi != 1 ] && [ $efi != 0 ]
                then
                        echo " " ; echo "Wrong answer... try again." ; echo " "
                else
                        pass=0
                fi
        done

        pass=1

        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Type in desired name for a computer:" ; echo " "
                read hostname

                lenght=${#hostname}

                if [ $lenght -lt 3 ] || [ -z hostname ]
                then
                        echo " " ; echo "Hostname is too small or empty input... try again." ; echo " "
                else
                        pass=0
                fi
        done

        pass=1

        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Type in password for root:" ; echo " "
                echo ">" ; read -s rootpwd ; echo " " ; echo "<"

                lenght=${#rootpwd}

                if [ $lenght -lt 5 ] || [ -z rootpwd ]
                then
                        echo " " ; echo "Password is too small or empty input... try again." ; echo " "
                else
                        pass=0
                fi
        done

        pass=1

        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Type in desired username:" ; echo " "
                read username

                lenght=${#username}

                if [ $lenght -lt 3 ] || [ -z rootpwd ]
                then
                        echo " " ; echo "Username is too small or empty input... try again." ; echo " "
                else
                        pass=0
                fi
        done

        pass=1

        userpwd=$rootpwd

        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Are you a superuser? (Type '1' for Yes, '0' for No)" ; echo " "
                read superuser

                if [ $cpu_choice != 1 ] && [ $cpu_choice != 0 ]
                then
                        echo " " ; echo "Wrong answer... try again." ; echo " "
                else
                        pass=0
                fi
        done

        pass=1

        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Which CPU is this PC using? (Type '0' for AMD, '1' for Intel)" ; echo " "
                read cpu_choice

                if [ $cpu_choice != 1 ] && [ $cpu_choice != 0 ]
                then
                        echo " " ; echo "Wrong answer... try again." ; echo " "
                else
                        pass=0
                fi
        done

        pass=1

        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Which GPU is this PC using? (Type '0' for AMD, '1' for Intel, and '2' for nVidia)" ; echo " "
                read gpu_choice

                if [ $gpu_choice != 0 ] && [ $gpu_choice != 1 ] && [ $gpu_choice != 2 ]
                then
                        echo " " ; echo "Wrong answer... try again." ; echo " "
                else
                        pass=0
                fi
        done

        pass=1

        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Are you sure that this info you entered is correct? Do you want to continue with installation? (Type '1' to continue, '0' to enter all information again):" ; echo " "
                read flag

                if [ $flag != 1 ] && [ $flag != 0 ]
                then
                        echo " " ; echo "Wrong answer... try again." ; echo " "
                else
                        pass=0
                        clear
                fi
        done
done

#########
# SETUP #
#########

set -o pipefail

reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syy --noconfirm

timedatectl set-ntp true

################
# PARTITIONING #
################

if [ $efi == 1 ]
then
        boot_n="1"
        boot_size="+512M"
        boot_type="EF00"

        swap_n="2"
        swap_size="+8192M"
        swap_type="8200"

        root_n="3"
        root_size="+30G"
        root_type="8304"

        home_n="4"
        home_type="8302"

        # Input line where it creates new GPT table scheme.
        sgdisk -p $ssd
        sgdisk -o $ssd
        sgdisk -n $boot_n:0G:$boot_size -t $boot_n:$boot_type -g $ssd
        sgdisk -n $swap_n:0G:$swap_size -t $swap_n:$swap_type -g $ssd
        sgdisk -n $root_n:0G:$root_size -t $root_n:$root_type -g $ssd
        sgdisk -n $home_n:0G -t $home_n:$home_type -g $ssd
else
        bios_boot_n="1"
        bios_boot_size="+1M"
        bios_boot_type="EF02"

        swap_n="2"
        swap_size="+8192M"
        swap_type="8200"

        root_n="3"
        root_size="+30G"
        root_type="8304"

        home_n="4"
        home_type="8302"

        # Input line where it creates new GPT table scheme.
        sgdisk -p $ssd
        sgdisk -o $ssd
        sgdisk -n $bios_boot_n:0:$bios_boot_size -t $bios_boot_n:$bios_boot_type -g $ssd
        sgdisk -n $swap_n:0G:$swap_size -t $swap_n:$swap_type -g $ssd
        sgdisk -n $root_n:0G:$root_size -t $root_n:$root_type -g $ssd
        sgdisk -n $home_n:0G -t $home_n:$home_type -g $ssd
fi

###################
# FORMATTING DISK #
###################

one="1"
two="2"
three="3"
four="4"
five="5"

if [ $efi == 1 ]
then
        temp="$ssd$one"
        mkfs.fat -F32 $temp
        temp=""

        temp="$ssd$two"
        mkswap $temp
        swapon $temp
        temp=""

        temp="$ssd$three"
        mkfs.ext4 $temp
        temp=""

        temp="$ssd$four"
        mkfs.ext4 $temp
        temp=""

        temp="$ssd$three"
        mount $temp /mnt
        mkdir /mnt/boot ; mkdir /mnt/home
        temp=""

        temp="$ssd$one"
        mount $temp /mnt/boot
        temp=""

        temp="$ssd$four"
        mount $temp /mnt/home
else
        temp="$ssd$two"
        mkswap $temp
        swapon $temp
        temp=""

        temp="$ssd$three"
        mkfs.ext4 $temp
        temp=""

        temp="$ssd$four"
        mkfs.ext4 $temp
        temp=""

        temp="$ssd$three"
        mount $temp /mnt
        mkdir /mnt/home
        temp=""

        temp="$ssd$four"
        mount $temp /mnt/home
fi

################
# INSTALLATION #
################

apps="veracrypt thunderbird arandr borg units firefox transmission-gtk ciano kamoso kdeconnect kphotoalbum strawberry pavucontrol spectacle sxiv vlc alacritty bleachbit blueberry doublecmd-gtk2 gparted htop k3b nautilus psensor redshift bookworm calibre calligra gedit libreoffice-still mcomix paperwork zathura gnome-calculator korganizer kronometer gnome-disk-utility"
internet=" broadcom-wl icedtea-web networkmanager nftables reflector webkit2gtk youtube-dl network-manager-applet wireless_tools wpa_supplicant iw"
storage=" android-file-transfer ark cdrdao cdrtools dvd+rw-tools fuseiso grub gzip mtpfs p7zip pacman-contrib udiskie unrar unzip zip"
utilities=" numlockx git os-prober blueman bluez-tools bluez-utils cmake cups cups-pdf dbus dialog dmidecode hardinfo libtool libxft libxinerama linux-hardened neofetch picom python python-pipenv python3 xorg-server xorg-xinit mesa"
text=" gedit-plugins zathura-pdf-mupdf ttf-font-awesome ttf-inconsolata gnu-free-fonts vim"
extra=" opendoas pulseaudio pulseaudio-alsa pulseaudio-bluetooth python-pyalsa" # sudo
misc=" alsa alsa-utils ffmpeg mpc mpd acpi alsa-lib alsa-plugins"
codecs=" wavpack a52dec celt lame libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"

efi_package=" efibootmgr"

essential=" base base-devel linux linux-firmware"
desktopenv=" lightdm lightdm-gtk-greeter lxqt breeze-icons" # plasma-desktop

cpu_amd=" amd-ucode"
cpu_intel=" intel-ucode"

gpu_amd=" xf86-video-ati xf86-video-amdgpu vulkan-radeon"
gpu_intel=" xf86-video-intel vulkan-intel"
gpu_nvidia=" xf86-video-nouveau"

superuserpack=" git curl vi man-db man-pages texinfo openssh wget gxkb kcron testdisk ardour code atom qtractor audacity gimp ruby-sass gcc-go go ranger cmatrix virtualbox virtualbox-host-modules-arch vim-latexsuite gummi calcurse xwallpaper termdown"

if [ $superuser == 1 ]
then
        musthave="$apps$internet$storage$utilities$text$extra$misc$codecs$essential$superuserpack"
else
        musthave="$apps$internet$storage$utilities$text$extra$misc$codecs$essential$desktopenv"
fi

if [ $gpu_choice == 0 ] && [ $cpu_choice == 0 ]
then
        drivers="$gpu_amd$cpu_amd"
else
        something=1
fi

if [ $gpu_choice == 0 ] && [ $cpu_choice == 1 ]
then
        drivers="$gpu_amd$cpu_intel"
else
        something=1
fi

if [ $gpu_choice == 1 ] && [ $cpu_choice == 0 ]
then
        drivers="$gpu_intel$cpu_amd"
else
        something=1
fi

if [ $gpu_choice == 1 ] && [ $cpu_choice == 1 ]
then
        drivers="$gpu_intel$cpu_intel"
else
        something=1
fi

if [ $gpu_choice == 2 ] && [ $cpu_choice == 0 ]
then
        drivers="$gpu_nvidia$cpu_amd"
else
        something=1
fi

if [ $gpu_choice == 2 ] && [ $cpu_choice == 1 ]
then
        drivers="$gpu_nvidia$cpu_intel"
else
        something=1
fi

if [ $efi == 1 ]
then
        packagelist="$musthave$drivers$efi_package"
else
        packagelist="$musthave$drivers"
fi

pacstrap /mnt $packagelist

pwd > dest.txt
curr_dest=$(<dest.txt)
cd /mnt
git clone https://github.com/windwalk-bushido/Atina.git ; cd $curr_dest ; rm dest.txt

genfstab -U /mnt > /mnt/etc/fstab

mkdir /mnt/note
echo $ssd > /mnt/note/ssd.txt
echo $efi > /mnt/note/efi.txt
echo $hostname > /mnt/note/hostname.txt
echo $rootpwd > /mnt/note/rootpwd.txt
echo $username > /mnt/note/username.txt
echo $userpwd > /mnt/note/userpwd.txt
echo $gpu_choice > /mnt/note/gpu_choice.txt
echo $superuser > /mnt/note/superuser.txt

chmod ugo+rwx /mnt/note

reinstall=0

while [ $reinstall == 0 ]
do
        echo " " ; echo " " ; echo " "
        echo "Are you sure that the OS is installed properly? If you are an experienced user, see if there's any errors (Type '1' for 'Yes, continue', '0' for 'No, start installation again.'):" ; echo " "
        read resurrect

        if [ $resurrect != 1 ] && [ $resurrect != 0 ]
        then
                echo " " ; echo "Wrong answer... try again." ; echo " "
        else
                if [ $resurrect == 1 ]
                then
                        arch-chroot /mnt
                else
                        reinstall=1

                        umount -R /mnt
                        temp="$ssd$three"
                        swapoff $temp
                        temp=""

                        # Format (wipe) whole SSD/Hard disk.

                        clear
                fi
        fi
done
