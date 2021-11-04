#!/bin/bash




git add *
echo "Commit message:"
read message
git commit -m "$message"
git push origin master
