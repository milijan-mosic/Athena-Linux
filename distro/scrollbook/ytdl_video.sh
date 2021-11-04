#!/bin/bash




echo -e "\nPlease type a link:"
read link
cd ~/Videos/
echo -e "\n"
sudo youtube-dl --audio-quality 0 --merge-output-format mkv $link ; cd ~/
echo -e "\nDONE!\n\n"
