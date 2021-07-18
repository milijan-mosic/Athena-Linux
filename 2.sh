#!/bin/bash




#########
# SETUP #
#########


timedatectl set-ntp true
hwclock -w


ssd=$(</note/ssd.txt)
uefi=$(</note/uefi.txt)
hostname=$(</note/hostname.txt)
root_password=$(</note/root_password.txt)
username=$(</note/username.txt)
user_password=$(</note/user_password.txt)


reflector --latest 100 --sort rate --save /etc/pacman.d/mirrorlist




#######################
# SETTING UP TIMEZONE #
#######################


ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
timedatectl set-timezone Europe/Belgrade




#############################
# ENABLING SYSTEMD SERVICES #
#############################


systemctl enable NetworkManager
systemctl enable nftables.service




######################################
# CREATING USER & CHANGING PASSWORDS #
######################################


useradd -m -G wheel -s /bin/bash $username
gpasswd -a $username optical
gpasswd -a $username storage
gpasswd -a $username power
gpasswd -a $username rfkill # User could'nt change Bluetooth On/Off without this... weird.
echo -e "$root_password\n$root_password" | passwd root
echo -e "$user_password\n$user_password" | passwd $username


rm /etc/sudoers
cp /Athena-Linux/files/sudoers /etc/




############################################
# SETTING UP LANGUAGES AND KEYBOARD LAYOUT #
############################################


sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' etc/locale.gen
sed -i 's/#sr_RS UTF-8/sr_RS UTF-8/g' etc/locale.gen
locale-gen


set_lang="LANG=en_US.UTF-8"
echo $set_lang > /etc/locale.conf




############################################
# SETTING UP HOSTNAME AND NETWORK SETTINGS #
############################################


echo $hostname > /etc/hostname


rm /etc/hosts
wget -P /etc/ https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts




###########################
# FINALIZING INSTALLATION #
###########################


rm /etc/pacman.conf ; cp /Athena-Linux/files/pacman.conf /etc/


amixer sset "Auto-Mute Mode" Disabled
alsactl store


pacman -Sy --noconfirm
pacman -Scc --noconfirm




cp /Athena-Linux/scrollbook/normal_installation.sh /home/$username/ ; chmod ugo+rwx /home/$username/normal_installation.sh
cp /Athena-Linux/scrollbook/superuser_installation.sh /home/$username/ ; chmod ugo+rwx /home/$username/superuser_installation.sh
cp /Athena-Linux/scrollbook/server_installation.sh /home/$username/ ; chmod ugo+rwx /home/$username/server_installation.sh




###########################
# SETTING UP A BOOTLOADER #
###########################


if [ $uefi == 1 ]
then
        grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
        grub-mkconfig -o /boot/grub/grub.cfg
else
        grub-install --target=i386-pc $ssd
        grub-mkconfig -o /boot/grub/grub.cfg
fi

sed -i 's/set timeout=5/set timeout=0.1/g' /boot/grub/grub.cfg




rm -rf /note/
rm -rf /Athena-Linux/
