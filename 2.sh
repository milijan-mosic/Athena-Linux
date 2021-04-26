#!/bin/bash




#########
# SETUP #
#########


timedatectl set-ntp true
hwclock -w


ssd=$(</note/ssd.txt)
uefi=$(</note/uefi.txt)
hostname=$(</note/hostname.txt)
rootpwd=$(</note/rootpwd.txt)
username=$(</note/username.txt)
userpwd=$(</note/userpwd.txt)


reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist




#######################
# SETTING UP TIMEZONE #
#######################


ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
timedatectl set-timezone Europe/Belgrade




#############################
# ENABLING SYSTEMD SERVICES #
#############################


systemctl enable NetworkManager
systemctl enable NetworkManager-wait-online.service
systemctl enable nftables.service
systemctl enable lightdm




######################################
# CREATING USER & CHANGING PASSWORDS #
######################################


useradd -m -G wheel -s /bin/bash $username
gpasswd -a $username optical
gpasswd -a $username storage
gpasswd -a $username rfkill # User could'nt change Bluetooth On/Off without this... weird.
echo -e "$rootpwd\n$rootpwd" | passwd root
echo -e "$userpwd\n$userpwd" | passwd $username


rm /etc/sudoers
cp /Athena-Linux/files/sudoers /etc/




#####################################
# SETTING UP LANGUAGES AND KEYBOARD #
#####################################

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' etc/locale.gen
sed -i 's/#sr_RS UTF-8/sr_RS UTF-8/g' etc/locale.gen
locale-gen


cd /etc/ ; set_lang="LANG=en_US.UTF-8"
echo $set_lang > locale.conf ; cd /




############################################
# SETTING UP HOSTNAME AND NETWORK SETTINGS #
############################################


cd /etc/ ; echo $hostname > hostname


wget -P /etc/ https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts
sed -i 's/127.0.0.1 localhost.localdomain/127.0.1.1 $hostname.localdomain $hostname/g' /etc/hosts # Possible future bugs




###########################
# FINALIZING INSTALLATION #
###########################


echo "numlockx &" > /home/$username/xinitrc
echo " " >> /home/$username/xinitrc
echo "exec startplasma-x11" >> /home/$username/xinitrc
mv /home/$username/xinitrc /home/$username/.xinitrc


sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/#[multilib]/[multilib]/g' /etc/pacman.conf
sed -i 's/#Include = /etc/pacman.d/mirrorlist/Include = /etc/pacman.d/mirrorlist/g' /etc/pacman.conf


rm /etc/lightdm/lightdm.conf
cp /Athena-Linux/files/lightdm.conf /etc/lightdm/


cp -r /Athena-Linux/scrollbook /home/$username/
mv /home/$username/scrollbook /home/$username/.scrollbook
chmod ugo+rwx /home/$username/.scrollbook


mkdir -p /home/$username/.config/alacritty
cp /Athena-Linux/files/alacritty.yml /home/$username/.config/alacritty/


rm /home/$username/.bashrc
cp /home/$username/Athena-Linux/files/bashrc /home/$username/
mv /home/$username/bashrc /home/$username/.bashrc


amixer sset "Auto-Mute Mode" Disabled
alsactl store


pacman -Syu --noconfirm
bash /Athena-Linux/scrollbook/32bit.sh
pacman -Scc --noconfirm




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
