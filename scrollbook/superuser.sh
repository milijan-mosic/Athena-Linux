#!/bin/bash




sudo timedatectl set-ntp true




git clone https://aur.archlinux.org/paru.git ~/ ; mv ~/paru ~/.paru_aur_installer
cd ~/.paru_aur_installer/ ; makepkg -sic --noconfirm ; cd ~/




general_programs=" spectrwm numlockx thunderbird print-manager arandr firefox transmission-gtk ciano kamoso kdeconnect kphotoalbum strawberry spectacle sxiv vlc blueberry doublecmd-gtk2 gparted htop k3b nautilus psensor redshift bookworm calibre gedit libreoffice-still mcomix paperwork zathura gnome-calculator korganizer kronometer gnome-disk-utility"
internet=" icedtea-web webkit2gtk youtube-dl curl"
storage=" android-file-transfer ark cdrdao cdrtools dvd+rw-tools fuseiso gzip mtpfs p7zip pacman-contrib udiskie unrar unzip zip"
utilities=" blueman bluez-tools bluez-utils cups cups-pdf dmidecode hardinfo neofetch picom"
text=" gedit-plugins zathura-pdf-mupdf ttf-font-awesome ttf-inconsolata gnu-free-fonts"
extra=" pulseaudio-bluetooth"
misc=" ffmpeg mpc mpd acpi man-db man-pages texinfo"
codecs=" wavpack a52dec celt lame libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"
user_choice=" gxkb kcron testdisk code gimp ruby-sass ranger virtualbox virtualbox-host-modules-arch calcurse xwallpaper deno ts-node typescript npm"
add_this=" libunrar python termdown units borg xlockmore xscreensaver" # xxkb ?


user_programs="$general_programs$internet$storage$utilities$text$extra$misc$codecs$user_choice$add_this"


sudo pacman -Syu $user_programs --noconfirm
paru -S ttf-iosevka cherrytree labyrinth nerd-fonts-complete --noconfirm




sudo systemctl enable --now cups.socket




git clone https://github.com/windwalk-bushido/Athena-Linux.git ~/

cp -r ~/Athena-Linux/scrollbook ~/.scrollbook
rm ~/.scrollbook/32bit.sh
rm ~/.scrollbook/superuser.sh
rm ~/.scrollbook/normal.sh




echo "numlockx &" > ~/.xinitrc
echo " " >> ~/.xinitrc
echo "exec spectrwm" >> ~/.xinitrc


rm ~/.bashrc
cp ~/Athena-Linux/files/bashrc_superuser ~/.bashrc


mkdir -p ~/.config/alacritty
cp ~/Athena-Linux/files/alacritty.yml ~/.config/alacritty/


cp ~/Athena-Linux/files/spectrwm.conf ~/.spectrwm.conf
mkdir -p ~/.config/spectrwm
cp ~/Athena-Linux/files/baraction.sh ~/.config/spectrwm/


mkdir .screenlayout
cp ~/Athena-Linux/files/monitor.sh ~/.screenlayout/
cp ~/Athena-Linux/files/laptop.sh ~/.screenlayout/


mkdir ~/.wallpaper/ ; cp ~/Athena-Linux/files/wallpaper.jpg ~/.wallpaper/


sudo cp ~/Athena-Linux/files/hosts /etc/hosts_old


mkdir -p ~/.config/ranger/plugins/
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf


mkdir -p ~/.config/picom/
cp ~/Athena-Linux/files/picom.conf ~/.config/picom/




mkdir MOUNTPOINT

mkdir Music
mkdir Videos

mkdir Backup
mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Projects
mkdir Pictures




rm -r ~/Athena-Linux ; rm ~/normal.sh ; rm ~/superuser.sh ; rm ~/server.sh

paru -Scc --noconfirm
sudo pacman -Scc --noconfirm




startx
