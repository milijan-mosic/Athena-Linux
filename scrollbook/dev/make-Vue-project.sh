#!/bin/bash




echo -e "\nType in project name:\n"
read project_name

echo -e "\n\nDo you want to install Tailwind + FontAwesome? [y/Y] or [n/N]\n"
read answer




sudo npm install -g @vue/cli
mkdir -p ~/Projects/
cd ~/Projects/
vue create $project_name

cd $project_name/

rm src/App.vue
cp ~/Projects/athena-linux/files/dev/App.vue src/

rm -r src/components
mkdir -p src/components
cp ~/Projects/athena-linux/files/dev/TEMPLATE.vue src/components/




cd ~/Projects/$project_name/

if [ $answer == 'y' ] || [ $answer == 'Y' ]
then
        bash ~/Projects/athena-linux/scrollbook/dev/install-TailwindCSS.sh
	bash ~/Projects/athena-linux/scrollbook/dev/install-font-awesome-vue.sh
fi
