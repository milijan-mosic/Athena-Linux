#!/bin/bash




##############
# USER INPUT #
##############


clear
flag=0

while [ $flag == 0 ]
do
        pass=1
        while [ $pass == 1 ]
        do
                echo -e "\n" ; lsblk ; echo -e "\n\n\n"
                echo "Where do you want to install Athena?" ; echo -e "\n"
                echo "Type in SSD/hard disk device name."
                echo "(e.g. '/dev/sda' or '/dev/sdb' etc.)" ; echo -e "\n\n\n" ; echo ">>> "
                read ssd

                lenght=${#ssd}

                # Add additional condition for: $ssd != int nor float
                if [ $lenght -lt 8 ] || [ -z ssd ] # $ssd ?
                then
                        clear
                        echo "Input is not equal to 8 characters or is an empty input... try again." ; echo -e "\n\n"
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo -e "\n" ; ls /sys/firmware/efi/efivars ; echo -e "\n\n\n"
                echo "Is this an UEFI or BIOS motherboard?" ; echo -e "\n"
                echo "Type '0' for BIOS or '1' for UEFI."
                echo "(if 'no directory is found' error is above, it's BIOS.)" ; echo -e "\n\n\n" ; echo ">>> "
                read uefi

                if [ $uefi != 1 ] && [ $uefi != 0 ] || [ -z uefi ]
                then
                        clear
                        echo "Wrong answer or empty input... try again." ; echo -e "\n\n"
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo -e "\n\n\n"
                echo "Type in desired name for computer/laptop:"
                echo "(minimum 3 characters of lenght)" ; echo -e "\n\n\n" ; echo ">>> "
                read hostname

                lenght=${#hostname}

                # What's the maximum lenght of a hostname?
                if [ $lenght -lt 3 ] || [ -z hostname ]
                then
                        clear
                        echo "Hostname is too small or empty input... try again."
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                rootpwd=""
                echo -e "\n\n\n"
                echo "Type in password for root:"
                echo "(minimum 5 characters of lenght | please use strong password)" ; echo -e "\n\n\n" ; echo ">>> "
                read -s rootpwd1
                echo -e "\n" ; echo "Type it again >>> "
                read -s rootpwd2

                if [ $rootpwd1 != $rootpwd2 ] || [ -z rootpwd1 ] || [ -z rootpwd2 ]
                then
                        clear
                        echo "Password is too small, or there are some empty inputs or passwords does'nt match... try again."
                else
                        lenght=${#rootpwd1}

                        # What's the maximum lenght of a password?
                        if [ $lenght -lt 5 ]
                        then
                                clear
                                echo "Password is too small... try again."
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
                echo -e "\n\n\n"
                echo "Type in desired username for main user account:" ; echo -e "\n"
                echo "(minimum 3 characters of lenght)" ; echo -e "\n\n\n" ; echo ">>> "
                read username

                lenght=${#username}

                # What's the maximum lenght of a username? Can it contain numbers?
                if [ $lenght -lt 3 ] || [ -z username ]
                then
                        clear
                        echo "Username is too small or is an empty input... try again."
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                userpwd=""
                echo -e "\n\n\n"
                echo "Type in password for new user:"
                echo "(minimum 5 characters of lenght | please use strong password)" ; echo -e "\n\n\n" ; echo ">>> "
                read -s userpwd1
                echo -e "\n" ; echo "Type it again >>> "
                read -s userpwd2

                if [ $userpwd1 != $userpwd2 ] || [ -z userpwd1 ] || [ -z userpwd2 ]
                then
                        clear
                        echo "Password is too small, or there are some empty inputs or passwords does'nt match... try again."
                else
                        lenght=${#userpwd1}

                        # What's the maximum lenght of a password?
                        if [ $lenght -lt 5 ]
                        then
                                clear
                                echo "Password is too small... try again."
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
                echo -e "\n\n\n"
                echo "Which CPU is this computer/laptop using?"
                echo "Type '0' for AMD or '1' for Intel." ; echo -e "\n\n\n" ; echo ">>> "
                read cpu_choice

                if [ $cpu_choice != 1 ] && [ $cpu_choice != 0 ] || [ -z cpu_choice ]
                then
                        clear
                        echo "Wrong answer or empty input... try again."
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo -e "\n\n\n"
                echo "Which GPU is this computer/laptop using?"
                echo "Type '0' for AMD, '1' for Intel or '2' for nVidia." ; echo -e "\n\n\n" ; echo ">>> "
                read gpu_choice

                if [ $gpu_choice != 0 ] && [ $gpu_choice != 1 ] && [ $gpu_choice != 2 ] || [ -z gpu_choice ]
                then
                        clear
                        echo "Wrong answer or empty input... try again."
                else
                        pass=0
                        clear
                fi
        done


        pass=1
        while [ $pass == 1 ]
        do
                echo -e "\n\n\n"
                echo "Are you sure that this info you entered is correct?" ; echo -e "\n"
                echo "Do you want to continue with installation?"
                echo "Type '1' to continue or '0' to enter all information again." ; echo -e "\n\n\n" ; echo ">>> "
                read flag

                if [ $flag != 1 ] && [ $flag != 0 ] || [ -z flag ]
                then
                        clear
                        echo "Wrong answer or empty input... try again."
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


reflector --latest 50 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy --noconfirm




################
# PARTITIONING #
################


swap_n="2"
swap_size="+8192M"
swap_type="8200"

root_n="3"
root_size="+30G"
root_type="8304"

home_n="4"
home_type="8302"

sgdisk -Z $ssd
sgdisk -p $ssd
sgdisk -o $ssd

if [ $uefi == 1 ]
then
        boot_n="1"
        boot_size="+512M"
        boot_type="EF00"

        sgdisk -n $boot_n:0G:$boot_size -t $boot_n:$boot_type -g $ssd
else
        bios_boot_n="1"
        bios_boot_size="+1M"
        bios_boot_type="EF02"

        sgdisk -n $bios_boot_n:0:$bios_boot_size -t $bios_boot_n:$bios_boot_type -g $ssd
fi

sgdisk -n $swap_n:0G:$swap_size -t $swap_n:$swap_type -g $ssd
sgdisk -n $root_n:0G:$root_size -t $root_n:$root_type -g $ssd
sgdisk -n $home_n:0G -t $home_n:$home_type -g $ssd




##############
# ENCRYPTION #
##############


# To do...




##############
# FORMATTING #
##############


one="1"
two="2"
three="3"
four="4"

if [ $uefi == 1 ]
then
        temp="$ssd$one"
        mkfs.fat -F32 $temp
        temp=""
else
        something=1
fi

temp="$ssd$two"
mkswap $temp
swapon $temp
temp=""

temp="$ssd$three"
mkfs.ext4 -F $temp
temp=""

temp="$ssd$four"
mkfs.ext4 -F $temp
temp=""

temp="$ssd$three"
mount $temp /mnt
temp=""

if [ $uefi == 1 ]
then
        mkdir /mnt/boot
        mkdir /mnt/home

        temp="$ssd$one"
        mount $temp /mnt/boot
        temp=""
else
        mkdir /mnt/home
fi

temp="$ssd$four"
mount $temp /mnt/home
temp=""




################
# INSTALLATION #
################


uefi_package=" efibootmgr"

essential="base base-devel linux linux-firmware grub linux-hardened"
desktop_env=" lightdm lightdm-gtk-greeter plasma-desktop libtool libxft libxinerama xorg-server xorg-xinit"

misc=" alacritty numlockx mesa python python-pipenv python3 cmake dbus dialog sudo alsa alsa-utils alsa-lib alsa-plugins pulseaudio pulseaudio-alsa python-pyalsa pavucontrol"
internet=" broadcom-wl networkmanager nftables reflector network-manager-applet wireless_tools wpa_supplicant iw wget"

cpu_amd=" amd-ucode"
cpu_intel=" intel-ucode"

gpu_amd=" xf86-video-ati xf86-video-amdgpu vulkan-radeon"
gpu_intel=" xf86-video-intel vulkan-intel"
gpu_nvidia=" xf86-video-nouveau"


musthave="$essential$desktop_env$misc$internet"




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
pwd > destination.txt
current_destination=$(<destination.txt)

cd /mnt
git clone https://github.com/windwalk-bushido/Athena-Linux.git
cd $current_destination ; rm destination.txt


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
