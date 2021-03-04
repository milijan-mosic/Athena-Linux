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

set -e
set -o pipefail

reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist


cp -r /Athena-Linux/scrollbook /etc/
cp -r /Athena-Linux/scrollbook/my_systemd_services /etc/systemd/system/



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
systemctl enable paccache.timer
systemctl enable lightdm

systemctl enable clamav-freshclam.service
systemctl enable clamav-daemon.service

#systemctl enable picom.service
#systemctl enable update-mirrors.service
#systemctl enable update-system.service
#systemctl enable set-wallpaper.service



######################################
# CREATING USER & CHANGING PASSWORDS #
######################################

echo -e "$rootpwd\n$rootpwd" | passwd root
useradd -m -G wheel -s /bin/bash $username
gpasswd -a $username optical
gpasswd -a $username storage
gpasswd -a $username rfkill # User could'nt change Bluetooth On/Off without this... weird.
echo -e "$userpwd\n$userpwd" | passwd $username


rm /etc/sudoers
cp /Athena-Linux/files/sudoers /etc/



#####################################
# SETTING UP LANGUAGES AND KEYBOARD #
#####################################

rm /etc/locale.gen
cp /Athena-Linux/files/locale.gen /etc/
locale-gen


cd /etc/ ; set_lang="LANG=en_US.UTF-8"
echo $set_lang > locale.conf ; cd /



############################################
# SETTING UP HOSTNAME AND NETWORK SETTINGS #
############################################

cd /etc/ ; echo $hostname > hostname


cp /Athena-Linux/files/hosts /etc/
ext=".localdomain $hostname"
base_hostname="$hostname$ext"
echo $base_hostname >> hosts
cat /Athena-Linux/files/block_ip_addresses >> hosts ; cd /



###########################
# FINALIZING INSTALLATION #
###########################

cd /home/$username/ ; mkdir .config ; chmod ugo+rwx /home/$username/.config/
cd /home/$username/.config/ ; mkdir alacritty
cp /Athena-Linux/files/alacritty.yml /home/$username/.config/alacritty/ ; cd /


rm /home/$username/.bashrc
cp /Athena-Linux/files/bashrc /home/$username/
mv /home/$username/bashrc /home/$username/.bashrc


cp /Athena-Linux/files/xinitrc /home/$username/
mv /home/$username/xinitrc /home/$username/.xinitrc


rm /etc/pacman.conf
cp /Athena-Linux/files/pacman.conf /etc/


rm /etc/lightdm/lightdm.conf
cp /Athena-Linux/files/lightdm.conf /etc/lightdm/


amixer sset "Auto-Mute Mode" Disabled
alsactl store


# Delete if calling scripts causes no problems.
#cd /home/$username/ ; mkdir .atina ; chmod ugo+rwx /home/$username/.atina/
#cp -r /Athena-Linux/scrollbook/ /home/$username/.atina/ ; cd /


cd / ; git clone https://github.com/windwalk-bushido/Athena-Linux-DE-Configs.git
mv /Athena-Linux-DE-Configs Configs
rm -rf /home/$username/.config/lxqt
cp -r /Configs/lxqt /home/$username/.config/
cp -r /Configs/wallpaper /etc/scrollbook/ ; chmod ugo+rwx /etc/scrollbook

cd /etc/ ; mkdir my_configs
cd my_configs ; mkdir menu_icon
cd menu_icon/ ; cp /Configs/helmet.svg . ; cd /


pacman -Syu --noconfirm
bash /Athena-Linux/scrollbook/32bit.sh

pacman -Rns lxqt-archiver pcmanfm-qt qterminal lxqt-about --noconfirm
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
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config # Disabling logging into root via SSH


rm -rf /note/
rm -rf /Athena-Linux/
rm -rf /Configs/
