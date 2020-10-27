#!/bin/bash
cd
mkdir test
cd test
wget -c https://archive.org/download/mb_unified_rompacks_202010/x1_unified_rompack.7z -q --show-progress
7z x -y -aoa /home/pi/test/x1_unified_rompack.7z
sudo mv x1 /home/pi/RetroPie/roms
sudo rm "x1_unified_rompack.7z"
cd ..
sudo rm -R test
touch /tmp/es-restart && kill -15 $(pidof emulationstation)


