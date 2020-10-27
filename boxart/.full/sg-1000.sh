#!/bin/bash
cd
mkdir test
cd test
wget -c https://archive.org/download/mb_unified_rompacks_202010/sg-1000_unified_rompack.7z -q --show-progress
7z x -y -aoa /home/pi/test/sg-1000_unified_rompack.7z
sudo mv sg-1000 /home/pi/RetroPie/roms
sudo rm "sg-1000_unified_rompack.7z"
cd ..
sudo rm -R test
touch /tmp/es-restart && kill -15 $(pidof emulationstation)


