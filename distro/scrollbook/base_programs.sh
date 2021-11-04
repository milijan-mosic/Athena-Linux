#!/bin/bash




sound="openal alsa alsa-utils pulseaudio pulseaudio-alsa pavucontrol pulseaudio-bluetooth"
desktop_environment="plasma-desktop kinfocenter powerdevil plasma-nm kdeplasma-addons quota-tools plank lightdm lightdm-gtk-greeter accountsservice"
bluetooth_support="blueberry blueman bluez-tools bluez-utils"
fonts="ttf-inconsolata gnu-free-fonts ttc-iosevka"
misc="pkgstats picom dbus python pacman-contrib"

system="$sound $desktop_environment $bluetooth_support $fonts $misc"


screenshot_tool="spectacle kipi-plugins"
music_player="strawberry gst-libav gst-plugins-bad gst-plugins-ugly"
video_player="vlc libcdio"
image_viewer="gwenview kamera kimageformats qt5-imageformats v4l-utils"
stopwatch="kronometer"
calculator="gnome-calculator"
task_manager="ksysguard psensor"
email_app="thunderbird libcanberra"
browser="firefox libnotify"
torrent_app="transmission-gtk"
sharing_tools="kdeconnect android-file-transfer mtpfs"
download_tool="youtube-dl"
archiver="ark p7zip unrar unarchiver"
#backup_tool="borg openssh python-llfuse x11-ssh-askpass xorg-xauth"
disk_cleaner="bleachbit"
disk_formatter="gparted gnome-disk-utility btrfs-progs dosfstools exfatprogs f2fs-tools gpart ntfs-3g polkit xfsprogs e2fsprogs gptfdisk"
dvd_burner="k3b cdparanoia cdrdao cdrtools dvd+rw-tools emovix transcode vcdimager libquicktime"
firewall_tool="ufw"
file_manager="nautilus python-nautilus"
password_manager="keepassxc xclip"
notepad="gedit gedit-plugins" # cherrytree swap with some other note-taking app (with nodes and subnodes)
printer_n_scanner="print-manager system-config-printer cups cups-pk-helper libsecret ipp-usb cups-pdf bluez-cups"
multi_monitor_tool="arandr"
office="libreoffice-still libpaper gtk3 sane"
pdf_reader="zathura zathura-cb zathura-pdf-mupdf"
image_manipulation="gimp gutenprint"
utilities="redshift python-gobject python-pyxdg ciano kamoso ffmpeg acpi vym neofetch xorg-xrandr xorg-xprop udiskie"
browser_addons="firefox-ublock-origin firefox-extension-https-everywhere firefox-decentraleyes firefox-adblock-plus"

general_programs="$screenshot_tool $music_player $video_player $image_viewer $stopwatch $calculator $task_manager $email_app $browser $torrent_app $sharing_tools $download_tool $archiver $disk_cleaner $disk_formatter $dvd_burner $firewall_tool $file_manager $password_manager $notepad $printer_n_scanner $multi_monitor_tool $office $pdf_reader $image_manipulation $utilities $browser_addons" # $backup_tool - webkit2gtk ?


codecs="wavpack a52dec celt lame libavif libheif libmad libmpcdec opus libvorbis opencore-amr speex libdca flac faac faad2 libfdk-aac jasper libwebp aom dav1d rav1e schroedinger libdv x264 x265 libde265 libmpeg2 xvidcore libtheora libvpx fdkaac"


user_programs="$system $general_programs $codecs"

sudo pacman -S $user_programs --noconfirm
