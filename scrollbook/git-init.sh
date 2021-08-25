#!/bin/bash




echo -e "Type in project link:\n"
read link
full_link="$link.git"

git init
git add *
git commit -m "Init"
git branch -M master
git remote add origin $full_link
git push -u origin master

