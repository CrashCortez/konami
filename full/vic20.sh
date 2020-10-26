#!/bin/bash
cd
mkdir test
cd test
wget -c https://archive.org/download/mb_unified_rompacks_202010/vic20_unified_rompack.7z -q --show-progress
7z x -y -aoa /home/pi/test/vic20_unified_rompack.7z
sudo mv vic20 /home/pi/RetroPie/roms
sudo rm "vic20_unified_rompack.7z"
cd ..
sudo rm -R test
touch /tmp/es-restart && kill -15 $(pidof emulationstation)


