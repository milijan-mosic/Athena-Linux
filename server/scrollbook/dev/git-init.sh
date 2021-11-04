#!/bin/bash




echo -e "Type in project link:\n"
read link

rm -r .git
git init
git add *
git commit -m "Init"
git branch -M master
git remote add origin $link
git push -u origin master
