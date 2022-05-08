#!/bin/bash




##############
# USER INPUT #
##############


timedatectl set-ntp true




clear

got_user_input=false
while [ $got_user_input == false ]
do
  pass=false
  while [ $pass == false ]
  do
    echo -e "\n" ; lsblk
    echo -e "\n\n\nWhere do you want to install Athena Linux?\nType in SSD/hard disk device name:\n\n(e.g. '/dev/sda' or '/dev/sdb' etc...)\n\n\n>>>"
    read ssd

    length=${#ssd}
    if [ $length -ge 8 ]; then
      pass=true
      clear
    else
      clear
      echo -e "\n\nInput is not equal to 8 characters or is an empty input... try again.\n\n"
    fi
  done


  pass=false
  while [ $pass == false ]
  do
    echo -e "\n" ; ls /sys/firmware/efi/efivars
    echo -e "\n\n\nIs this an UEFI or BIOS firmware?\nType '0' for BIOS or '1' for UEFI:\n\n(if 'no directory is found' error is above, it's BIOS)\n\n\n>>>"
    read uefi

    if [ $uefi == 1 ] || [ $uefi == 0 ]; then
      pass=true
      clear
    else
      clear
      echo -e "\n\nWrong answer or empty input... try again.\n\n"
    fi
  done


  pass=false
  while [ $pass == false ]
  do
    echo -e "\n\nType in desired name for device:\n\n(minimum 3 characters of length)\n\n\n>>>"
    read hostname

    length=${#hostname}
    if [ $length -ge 3 ]; then
      pass=true
      clear
    else
      clear
      echo -e "\n\nHostname is too small or empty input... try again.\n\n"
    fi
  done


  pass=false
  while [ $pass == false ]
  do
    echo -e "\n\nType in desired username for main user account:\n\n(minimum 3 characters of length)\n\n\n>>>"
    read username

    length=${#username}
    if [ $length -ge 3 ]; then
      pass=true
      clear
    else
      clear
      echo -e "\n\nUsername is too small or is an empty input... try again.\n\n"
    fi
  done


  pass=false
  while [ $pass == false ]
  do
    user_password=""
    echo -e "\n\nType in password for main user account:\n\n(minimum 5 characters of length)\n\n\n>>>"
    read -s user_password1
    echo -e "\nType it again >>>"
    read -s user_password2

    if [ $user_password1 == $user_password2 ]; then
      pass_length1=${#user_password1}
      pass_length2=${#user_password2}
      if [ $pass_length1 -ge 5 ] && [ $pass_length2 -ge 5 ]; then
  pass=true
  user_password=$user_password1
  clear
      else
  echo -e "\n\nPassword is too small.\n\n"
      fi
    else
      clear
      echo -e "\n\nPasswords doesn't match or there are some empty inputs... try again.\n\n"
    fi
  done


  pass=false
  while [ $pass == false ]
  do
    root_password=""
    echo -e "\n\nType in password for root:\n\n(minimum 5 characters of length)\n\n\n>>>"
    read -s root_password1
    echo -e "\nType it again >>>"
    read -s root_password2

    if [ $root_password1 == $user_password2 ]; then
      pass_length1=${#root_password1}
      pass_length2=${#root_password2}
      if [ $pass_length1 -ge 5 ] && [ $pass_length2 -ge 5 ]; then
  pass=true
  root_password=$root_password1
  clear
      else
  echo -e "\n\nPassword is too small.\n\n"
      fi
    else
      clear
      echo -e "\n\nPasswords doesn't match or there are some empty inputs... try again.\n\n"
    fi
  done


  pass=false
  while [ $pass == false ]
  do
    # Is there a way to show which CPU computer/laptop has?
    echo -e "\n\nWhich CPU is this device using?\nType '0' for AMD or '1' for Intel:\n\n\n>>>"
    read cpu_choice

    if [ $cpu_choice == 1 ] || [ $cpu_choice == 0 ]; then
      pass=true
      clear
    else
      clear
      echo -e "\n\nWrong answer or empty input... try again.\n\n"
    fi
  done


  pass=false
  while [ $pass == false ]
  do
    echo -e "\n" ; lspci -v | grep -A1 -e VGA -e 3D
    echo -e "\n\n\nWhich GPU is this device using?\nType '0' for AMD, '1' for Intel or '2' for nVidia:\n\n\n>>>"
    read gpu_choice

    if [ $gpu_choice == 0 ] || [ $gpu_choice == 1 ] || [ $gpu_choice == 2 ]; then
      pass=true
      clear
    else
      clear
      echo -e "\n\nWrong answer or empty input... try again.\n\n"
    fi
  done


  pass=false
  while [ $pass == false ]
  do
    echo -e "\n\nSSD device name: $ssd\n"

    if [ $uefi == 1 ]; then
      echo -e "Motherboard firmware: UEFI\n"
    else
      echo -e "Motherboard firmware: BIOS\n"
    fi

    echo -e "Name for a device: $hostname\n"
    echo -e "Username for main account: $username\n"

    if [ $cpu_choice == 0 ]; then
      echo -e "This device uses: AMD CPU\n"
    else
      echo -e "This device uses: Intel CPU\n"
    fi

    if [ $gpu_choice == 0 ]; then
      echo -e "This device uses: AMD GPU\n"
    else
      if [ $gpu_choice == 1 ]; then
  echo -e "This device uses: Intel GPU\n"
      else
  echo -e "This device uses: nVidia GPU\n"
      fi
    fi

    echo -e "Passwords should be kept secret ;)\n\n\n"




    echo -e "Are you sure that this info you entered is correct?"
    echo -e "Do you want to continue with installation?\n"
    echo -e "Type '1' to continue or '0' to enter all information again:\n\n\n>>>"
    read got_user_input

    if [ $got_user_input == 1 ] || [ $got_user_input == 0 ]; then
      pass=true
      clear
    else
      clear
      echo -e "\n\nWrong answer or empty input... try again.\n\n"
    fi
  done
done




#########
# SETUP #
#########


timedatectl set-ntp true


reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist




################
# PARTITIONING #
################


swap_n="2"
swap_size="+8192M"
swap_type="8200"

root_n="3"
root_size="+60G"
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


uefi_package="efibootmgr"

essential="base base-devel linux linux-firmware util-linux grub archlinux-keyring" # linux-hardened
desktop_server="xorg-server xorg-xinit"

cog_wheels="vim alacritty mesa sudo libva-mesa-driver mesa-vdpau"
internet_drivers="broadcom-wl networkmanager reflector network-manager-applet wireless_tools wpa_supplicant iw iwd wget git ca-certificates libsecret"

cpu_amd="amd-ucode"
cpu_intel="intel-ucode"

gpu_amd="xf86-video-ati" # xf86-video-amdgpu
gpu_intel="xf86-video-intel"
gpu_nvidia="xf86-video-nouveau"


musthave="$essential $desktop_server $cog_wheels $internet_drivers"




case "$gpu_choice" in
  0) drivers="$gpu_amd";;
  1) drivers="$gpu_intel";;
  2) drivers="$gpu_nvidia";;
esac

space=" "
drivers="$space"

case "$cpu_choice" in
  0) drivers="$cpu_amd";;
  1) drivers="$cpu_intel";;
esac




if [ $uefi == 1 ]
then
  packagelist="$musthave $drivers $uefi_package"
else
  packagelist="$musthave $drivers"
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
echo $root_password > /mnt/note/root_password.txt
echo $username > /mnt/note/username.txt
echo $user_password > /mnt/note/user_password.txt
echo $gpu_choice > /mnt/note/gpu_choice.txt
chmod ugo+rwx /mnt/note


arch-chroot /mnt
