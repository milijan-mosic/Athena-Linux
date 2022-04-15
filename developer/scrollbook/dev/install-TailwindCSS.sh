#!/bin/bash




vue add tailwind

rm tailwind.config.js
cp ~/Projects/athena-linux/developer/dev-files/tailwind.config.js .

rm src/assets/tailwind.css
cp ~/Projects/athena-linux/developer/dev-files/tailwind.css src/assets/

cp ~/Projects/athena-linux/developer/dev-files/index.css src/assets/

