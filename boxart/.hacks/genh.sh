#!/bin/bash
cd
mkdir test
cd test
wget -c https://archive.org/download/mb_unified_rompacks_202010/genh_unified_rompack.7z -q --show-progress
7z x -y -aoa /home/pi/test/genh_unified_rompack.7z
sudo mv genh /home/pi/RetroPie/roms
sudo rm "genh_unified_rompack.7z"
cd ..
sudo rm -R test
touch /tmp/es-restart && kill -15 $(pidof emulationstation)


