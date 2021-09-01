#!/bin/bash




echo -e "\nType in app name:\n"
read $app_name
composer create-project laravel/laravel $app_name
cd $app_name/
npm install
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
npx tailwindcss init
# Install Vue
npm install ; npm run dev ; npm run dev
php artisan serve

