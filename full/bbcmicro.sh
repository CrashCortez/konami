#!/bin/bash
cd
mkdir test
cd test
wget -c https://archive.org/download/mb_unified_rompacks_202010/bbcmicro_unified_rompack.7z -q --show-progress
7z x -y -aoa /home/pi/test/bbcmicro_unified_rompack.7z
sudo mv bbcmicro /home/pi/RetroPie/roms
sudo rm "bbcmicro_unified_rompack.7z"
cd ..
sudo rm -R test
touch /tmp/es-restart && kill -15 $(pidof emulationstation)


