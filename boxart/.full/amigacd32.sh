#!/bin/bash
cd
mkdir test
cd test
wget -c https://archive.org/download/mb_unified_rompacks_202010/amigacd32_unified_rompack.7z -q --show-progress
7z x -y -aoa /home/pi/test/amigacd32_unified_rompack.7z
sudo mv amigacd32 /home/pi/RetroPie/roms
sudo rm "amigacd32_unified_rompack.7z"
cd ..
sudo rm -R test
touch /tmp/es-restart && kill -15 $(pidof emulationstation)


