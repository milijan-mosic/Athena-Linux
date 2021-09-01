#!/bin/bash




echo -e "\nType in project name:\n"
read project_name

sudo npm install -g @vue/cli
mkdir -p ~/Projects/
cd ~/Projects/
vue create $project_name

