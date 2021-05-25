#!/bin/bash




cd ~/
sudo timedatectl set-ntp true




mkdir .paru_aur_installer ; cd ~/.paru_aur_installer
git clone https://aur.archlinux.org/paru.git ; cd paru
makepkg -sic --noconfirm ; cd ~/




general_programs=" spectrwm numlockx thunderbird print-manager arandr firefox transmission-gtk ciano kamoso kdeconnect kphotoalbum strawberry spectacle sxiv vlc blueberry doublecmd-gtk2 gparted htop k3b nautilus psensor redshift bookworm calibre gedit libreoffice-still mcomix paperwork zathura gnome-calculator korganizer kronometer gnome-disk-utility"
internet=" icedtea-web webkit2gtk youtube-dl curl"
storage=" android-file-transfer ark cdrdao cdrtools dvd+rw-tools fuseiso gzip mtpfs p7zip pacman-contrib udiskie unrar unzip zip"
utilities=" blueman bluez-tools bluez-utils cups cups-pdf dmidecode hardinfo neofetch picom"
text=" gedit-plugins zathura-pdf-mupdf ttf-font-awesome ttf-inconsolata gnu-free-fonts"
extra=" pulseaudio-bluetooth"
misc=" ffmpeg mpc mpd acpi man-db man-pages texinfo"
codecs=" wavpack a52dec celt lame libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"
user_choice=" gxkb kcron testdisk code gimp ruby-sass ranger virtualbox virtualbox-host-modules-arch calcurse xwallpaper deno ts-node typescript npm"


user_programs="$general_programs$internet$storage$utilities$text$extra$misc$codecs$user_choice"


sudo pacman -Syu $user_programs --noconfirm
paru -S ttf-iosevka cherrytree labyrinth --noconfirm




sudo systemctl enable --now cups.socket




git clone https://github.com/windwalk-bushido/Athena-Linux.git

cp -r ~/Athena-Linux/scrollbook ~/.scrollbook
rm ~/.scrollbook/32bit.sh
rm ~/.scrollbook/deploy_folders.sh
rm ~/.scrollbook/superuser.sh
rm ~/.scrollbook/normal.sh




echo "numlockx &" > ~/.xinitrc
echo " " >> ~/.xinitrc
echo "exec spectrwm" >> ~/.xinitrc


rm -rf ~/.bashrc
cp ~/Athena-Linux/files/bashrc_superuser ~/.bashrc


mkdir -p ~/.config/alacritty
cp ~/Athena-Linux/files/alacritty.yml ~/.config/alacritty/


cp ~/Athena-Linux/files/spectrwm.conf ~/.spectrwm.conf


mkdir .screenlayout
cp ~/Athena-Linux/files/layout.sh ~/.screenlayout/


mkdir ~/.wallpaper/ ; cp ~/Athena-Linux/files/wallpaper.jpg ~/.wallpaper/




mkdir MOUNTPOINT

mkdir Music
mkdir Videos

mkdir Backup
mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Projects




rm -rf ~/Athena-Linux ; rm ~/normal.sh ; rm ~/superuser.sh

paru -Scc --noconfirm
sudo pacman -Scc --noconfirm




startx
