#!/bin/bash

link=""
echo " " ; echo " " ; echo 'Please type a link:'
read $link
cd ~/Videos/
echo " " ; echo " "
sudo youtube-dl --audio-quality 0 --merge-output-format mkv $link
echo " " ; echo "DONE!" ; echo " "