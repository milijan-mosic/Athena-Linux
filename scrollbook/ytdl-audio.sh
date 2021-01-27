#!/bin/bash

link=""
echo " " ; echo 'Please type a link:'
read link
cd ~/Songs/
echo " "
sudo youtube-dl --audio-quality 0 -x --audio-format mp3 $link
echo " " ; echo "DONE!" ; echo " "
