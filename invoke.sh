#!/bin/bash



##############
# USER INPUT #
##############

clear
echo " " ; echo "WELCOME TO ATHENA LINUX! DOWN BELOW YOU'LL BE PROMPTED TO ENTER SOME ESSENTIAL INFO REQUIRED TO INSTALL THE OS." ; echo " "
echo "FRIENDLY REMINDER: IF YOU ENTERED WRONG INFO, STICK TO THE END. YOU'LL BE PROMPTED TO ENTER ALL INFO AGAIN :)" ; echo " " ; echo " "


flag=0
while [ $flag == 0 ]
do
        pass=1
        while [ $pass == 1 ]
        do
                echo " " ; lsblk ; echo " " ; echo " " ; echo " "
                echo "Where do you want to install Athena?" ; echo " "
                echo "Type in SSD/hard disk device name."
                echo "(e.g. '/dev/sda' or '/dev/sdb' etc.)" ; echo " " ; echo " " ; echo " " ; echo ">>> "
                read ssd

                lenght=${#ssd}

                # Add additional condition for lenght != number, nor int nor float
                if [ $lenght -lt 8 ] || [ -z ssd ]
                then
                        clear
                        echo " " ; echo "Input is not equal to 8 characters or empty input... try again." ; echo " " ; echo " "
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo " " ; ls /sys/firmware/efi/efivars ; echo " " ; echo " " ; echo " "
                echo "Is this an UEFI or BIOS motherboard?" ; echo " "
                echo "Type '0' for BIOS or '1' for UEFI."
                echo "(if 'no directory is found' error is above, it's BIOS)" ; echo " " ; echo " " ; echo " " ; echo ">>> "
                read uefi

                if [ $uefi != 1 ] && [ $uefi != 0 ] || [ -z uefi ]
                then
                        clear
                        echo " " ; echo "Wrong answer or empty input... try again." ; echo " " ; echo " "
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Type in desired name for computer/laptop:"
                echo "(minimum 3 characters of lenght)" ; echo " " ; echo " " ; echo " " ; echo ">>> "
                read hostname

                lenght=${#hostname}

                # Add additional condition for lenght != number, nor int nor float
                # What's the maximum lenght of a hostname?
                if [ $lenght -lt 3 ] || [ -z hostname ]
                then
                        clear
                        echo " " ; echo "Hostname is too small or empty input... try again." ; echo " " ; echo " "
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                rootpwd=""
                echo " " ; echo " " ; echo " "
                echo "Type in password for root:"
                echo "(minimum 5 characters of lenght | please use strong password)" ; echo " " ; echo " " ; echo " " ; echo ">>> "
                read -s rootpwd1
                echo " " ; echo "Type it again >>> "
                read -s rootpwd2

                if [ $rootpwd1 != $rootpwd2 ] || [ -z rootpwd1 ] || [ -z rootpwd2 ]
                then
                        clear
                        echo " " ; echo "Password is too small, or empty input or passwords does'nt match... try again." ; echo " " ; echo " "
                else
                        lenght=${#rootpwd1}

                        # What's the maximum lenght of a password?
                        if [ $lenght -lt 5 ]
                        then
                                clear
                                echo " " ; echo "Password is too small, or empty input or passwords does'nt match... try again." ; echo " " ; echo " "
                        else
                                pass=0
                                rootpwd="$rootpwd1"
                                clear
                        fi
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Type in desired username for main user account:" ; echo " "
                echo "(minimum 3 characters of lenght)" ; echo " " ; echo " " ; echo " " ; echo ">>> "
                read username

                lenght=${#username}

                # Add additional condition for lenght != number, nor int nor float
                # What's the maximum lenght of a username?
                if [ $lenght -lt 3 ] || [ -z username ]
                then
                        clear
                        echo " " ; echo "Username is too small or empty input... try again." ; echo " " ; echo " "
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                userpwd=""
                echo " " ; echo " " ; echo " "
                echo "Type in password for new user:"
                echo "(minimum 5 characters of lenght | please use strong password)" ; echo " " ; echo " " ; echo " " ; echo ">>> "
                read -s userpwd1
                echo " " ; echo "Type it again >>> "
                read -s userpwd2

                if [ $userpwd1 != $userpwd2 ] || [ -z userpwd1 ] || [ -z userpwd2 ]
                then
                        clear
                        echo " " ; echo "Password is too small, or empty input or passwords does'nt match... try again." ; echo " " ; echo " "
                else
                        lenght=${#userpwd1}

                        # What's the maximum lenght of a password?
                        if [ $lenght -lt 5 ]
                        then
                                clear
                                echo " " ; echo "Password is too small, or empty input or passwords does'nt match... try again." ; echo " " ; echo " "
                        else
                                pass=0
                                userpwd="$userpwd1"
                                clear
                        fi
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Which CPU is this computer/laptop using?"
                echo "Type '0' for AMD or '1' for Intel." ; echo " " ; echo " " ; echo " " ; echo ">>> "
                read cpu_choice

                if [ $cpu_choice != 1 ] && [ $cpu_choice != 0 ] || [ -z cpu_choice ]
                then
                        clear
                        echo " " ; echo "Wrong answer or empty input... try again." ; echo " " ; echo " "
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Which GPU is this computer/laptop using?"
                echo "Type '0' for AMD, '1' for Intel or '2' for nVidia." ; echo " " ; echo " " ; echo " " ; echo ">>> "
                read gpu_choice

                if [ $gpu_choice != 0 ] && [ $gpu_choice != 1 ] && [ $gpu_choice != 2 ] || [ -z gpu_choice ]
                then
                        clear
                        echo " " ; echo "Wrong answer or empty input... try again." ; echo " " ; echo " "
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo " " ; echo " " ; echo " "
                echo "Are you sure that this info you entered is correct?" ; echo " "
                echo "Do you want to continue with installation?"
                echo "Type '1' to continue or '0' to enter all information again." ; echo " " ; echo " " ; echo " " ; echo ">>> "
                read flag

                if [ $flag != 1 ] && [ $flag != 0 ] || [ -z flag ]
                then
                        clear
                        echo " " ; echo "Wrong answer or empty input... try again." ; echo " " ; echo " "
                else
                        pass=0
                        clear
                fi
        done
done



#########
# SETUP #
#########

timedatectl set-ntp true


set -e
set -o pipefail


reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy --noconfirm


# Can I have all advantages of /home partition without having to make it? I want to encrypt root with one passphrase and that's it.
sgdisk -Z $ssd
#cryptsetup open --type plain -d /dev/urandom $ssd to_be_wiped
#dd if=/dev/zero of=/dev/mapper/to_be_wiped status=progress
#cryptsetup close to_be_wiped



################
# PARTITIONING #
################

if [ $uefi == 1 ]
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

        sgdisk -p $ssd
        sgdisk -o $ssd
        sgdisk -n $bios_boot_n:0:$bios_boot_size -t $bios_boot_n:$bios_boot_type -g $ssd
        sgdisk -n $swap_n:0G:$swap_size -t $swap_n:$swap_type -g $ssd
        sgdisk -n $root_n:0G:$root_size -t $root_n:$root_type -g $ssd
        sgdisk -n $home_n:0G -t $home_n:$home_type -g $ssd
fi



##############
# ENCRYPTION #
##############

three="3"
four="4"

#temp="$ssd$three"
#cryptsetup -y -v luksFormat $temp
#cryptsetup open $temp cryptroot
#temp=""

#temp="$ssd$four"
#cryptsetup -y -v luksFormat $temp
#cryptsetup open $temp crypthome
#temp=""



##############
# FORMATTING #
##############

one="1"
two="2"

if [ $uefi == 1 ]
then
        temp="$ssd$one"
        mkfs.fat -F32 $temp
        temp=""

        temp="$ssd$two"
        mkswap $temp
        swapon $temp
        temp=""

        temp="$ssd$three"
        #temp="/dev/mapper/cryptroot"
        mkfs.ext4 -F $temp
        temp=""

        temp="$ssd$four"
        #temp="/dev/mapper/crypthome"
        mkfs.ext4 -F $temp
        temp=""

        temp="$ssd$three"
        #temp="/dev/mapper/cryptroot"
        mount $temp /mnt
        mkdir /mnt/boot ; mkdir /mnt/home
        temp=""

        temp="$ssd$one"
        mount $temp /mnt/boot
        temp=""

        temp="$ssd$four"
        #temp="/dev/mapper/crypthome"
        mount $temp /mnt/home
        temp=""
else
        temp="$ssd$two"
        mkswap $temp
        swapon $temp
        temp=""

        temp="$ssd$three"
        #temp="/dev/mapper/cryptroot"
        mkfs.ext4 -F $temp
        temp=""

        temp="$ssd$four"
        #temp="/dev/mapper/crypthome"
        mkfs.ext4 -F $temp
        temp=""

        temp="$ssd$three"
        #temp="/dev/mapper/cryptroot"
        mount $temp /mnt
        mkdir /mnt/home
        temp=""

        temp="$ssd$four"
        #temp="/dev/mapper/crypthome"
        mount $temp /mnt/home
        temp=""
fi



################
# INSTALLATION #
################

apps="thunderbird arandr borg units firefox transmission-gtk ciano kamoso kdeconnect kphotoalbum strawberry pavucontrol spectacle sxiv vlc alacritty bleachbit blueberry doublecmd-gtk2 gparted htop k3b nautilus psensor redshift bookworm calibre calligra gedit libreoffice-still mcomix paperwork zathura gnome-calculator korganizer kronometer gnome-disk-utility xwallpaper openssh"
internet=" broadcom-wl icedtea-web networkmanager nftables reflector webkit2gtk youtube-dl network-manager-applet wireless_tools wpa_supplicant iw"
storage=" android-file-transfer ark cdrdao cdrtools dvd+rw-tools fuseiso grub gzip mtpfs p7zip pacman-contrib udiskie unrar unzip zip"
utilities=" numlockx git os-prober blueman bluez-tools bluez-utils cmake cups cups-pdf dbus dialog dmidecode hardinfo libtool libxft libxinerama linux-hardened neofetch picom python python-pipenv python3 xorg-server xorg-xinit mesa"
text=" gedit-plugins zathura-pdf-mupdf ttf-font-awesome ttf-inconsolata gnu-free-fonts vim"
extra=" sudo pulseaudio pulseaudio-alsa pulseaudio-bluetooth python-pyalsa" # opendoas -> needs manual config.
misc=" alsa alsa-utils ffmpeg mpc mpd acpi alsa-lib alsa-plugins"
codecs=" wavpack a52dec celt lame libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"
browser_addons=" firefox-ublock-origin firefox-extension-https-everywhere firefox-decentraleyes firefox-adblock-plus"

uefi_package=" efibootmgr"

essential=" base base-devel linux linux-firmware"
desktop_env=" lightdm lightdm-gtk-greeter lxqt breeze-icons papirus-icon-theme deepin-icon-theme"

cpu_amd=" amd-ucode"
cpu_intel=" intel-ucode"

gpu_amd=" xf86-video-ati xf86-video-amdgpu vulkan-radeon"
gpu_intel=" xf86-video-intel vulkan-intel"
gpu_nvidia=" xf86-video-nouveau"


musthave="$apps$internet$storage$utilities$text$extra$misc$codecs$browser_addons$essential$desktop_env"


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

if [ $uefi == 1 ]
then
        packagelist="$musthave$drivers$uefi_package"
else
        packagelist="$musthave$drivers"
fi


pacstrap /mnt $packagelist



##############
# FINALIZING #
##############

# Wasn't sure of the current location while OS installs but I wanted to return to it after I clone OS repo.
pwd > dest.txt
curr_dest=$(<dest.txt)

cd /mnt
git clone https://github.com/windwalk-bushido/Athena-Linux.git
cd $curr_dest ; rm dest.txt


genfstab -U /mnt > /mnt/etc/fstab


mkdir /mnt/note
echo $ssd > /mnt/note/ssd.txt
echo $uefi > /mnt/note/uefi.txt
echo $hostname > /mnt/note/hostname.txt
echo $rootpwd > /mnt/note/rootpwd.txt
echo $username > /mnt/note/username.txt
echo $userpwd > /mnt/note/userpwd.txt
echo $gpu_choice > /mnt/note/gpu_choice.txt
chmod ugo+rwx /mnt/note


arch-chroot /mnt
