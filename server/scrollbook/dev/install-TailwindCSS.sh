#!/bin/bash




vue add tailwind

rm tailwind.config.js
cp ~/Projects/athena-linux-black/dev-files/tailwind.config.js .

rm src/assets/tailwind.css
cp ~/Projects/athena-linux-black/dev-files/tailwind.css src/assets/

cp ~/Projects/athena-linux-black/dev-files/index.css src/assets/

