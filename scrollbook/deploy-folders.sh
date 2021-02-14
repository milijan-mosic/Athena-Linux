#!/bin/bash

superuser=$(<~/superuser.txt)

if [ $superuser == 1 ]
then
        cd ~/
        git clone https://github.com/windwalk-bushido/AIFAL.git
        cp ~/AIFAL/sucklessoftware/ ~/

        cd /sucklessoftware/st/
        sudo make clean install

        cd /sucklessoftware/dwm/
        sudo make clean install

        cd /sucklessoftware/slstatus/
        sudo make clean install

        cd /sucklessoftware/dmenu/
        sudo make clean install

        cd ~/ ; rm -rf AIFAL
else
        goo=1
fi

echo " " ; echo "Deploying folders..." ; echo " "
cd ~/
mkdir Songs
mkdir Videos
mkdir Documents
mkdir Pictures
mkdir Downloads
mkdir Desktop
echo "DONE!" ; echo " "
