#!/bin/bash
cd
mkdir test
cd test
wget -c https://archive.org/download/mb_unified_rompacks_202010/dreamcast_unified_rompack_media_only.7z -q --show-progress
7z x -y -aoa /home/pi/test/dreamcast_unified_rompack_media_only.7z
sudo mv dreamcast /home/pi/RetroPie/roms
sudo rm "dreamcast_unified_rompack_media_only.7z"
cd ..
sudo rm -R test
touch /tmp/es-restart && kill -15 $(pidof emulationstation)


