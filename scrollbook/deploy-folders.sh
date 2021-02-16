#!/bin/bash

superuser=$(<~/superuser.txt)

echo " " ; echo "Deploying folders..." ; echo " "

if [ $superuser == 1 ]
then
        cd ~/
        git clone https://github.com/windwalk-bushido/AIFAL.git
        cp ~/AIFAL/sucklessoftware/ ~/
        mv sucklessoftware .sucklessoftware

        cd ~/.sucklessoftware/st/
        sudo make clean install

        cd ~/.sucklessoftware/dwm/
        sudo make clean install

        cd ~/.sucklessoftware/slstatus/
        sudo make clean install

        cd ~/.sucklessoftware/dmenu/
        sudo make clean install

        cd ~/
        mkdir Songs
        mkdir Videos
        mkdir Documents
        mkdir Pictures
        mkdir Downloads
        mkdir Desktop

        rm -rf AIFAL
else
        cd ~/
        mv Music Songs
        rm -r Public
        rm -r Templates
fi

rm superuser.txt
echo "DONE!" ; echo " "
