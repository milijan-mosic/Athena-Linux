#!/bin/bash




vue add tailwind

rm tailwind.config.js
cp ~/Projects/athena-linux/files/dev/tailwind.config.js .

rm src/assets/tailwind.css
cp ~/Projects/athena-linux/files/dev/tailwind.css src/assets/

cp ~/Projects/athena-linux/files/dev/index.css src/assets/

