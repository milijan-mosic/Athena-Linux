#!/bin/bash




echo -e "\nPlease type a link:"
read link
cd ~/Music/
echo -e "\n"
sudo youtube-dl --audio-quality 0 -x --audio-format mp3 $link ; cd ~/
echo -e "\nDONE!\n\n"
