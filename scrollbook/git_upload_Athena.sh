#!/bin/bash

cd ~/Athena-Linux/
git add *
echo "Commit message:"
read message
git commit -m "$message"
git push https://github.com/windwalk-bushido/Athena-Linux master
