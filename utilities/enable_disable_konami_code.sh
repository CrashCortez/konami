#!/bin/bash
cd
if [ -d "/home/pi/RetroPie/retropiemenu/konami/kiosk" ] 
then
sudo rm -R "/home/pi/RetroPie/retropiemenu/konami/kiosk"
mv /home/pi/RetroPie/retropiemenu/konami/full /home/pi/RetroPie/retropiemenu/konami/boxart/.full
mv /home/pi/RetroPie/retropiemenu/konami/hacks /home/pi/RetroPie/retropiemenu/konami/boxart/.hacks
else
mkdir /home/pi/RetroPie/retropiemenu/konami/kiosk
mv /home/pi/RetroPie/retropiemenu/konami/boxart/.full /home/pi/RetroPie/retropiemenu/konami/full
mv /home/pi/RetroPie/retropiemenu/konami/boxart/.hacks /home/pi/RetroPie/retropiemenu/konami/hacks
fi
touch /tmp/es-restart
kill -15 $(pidof emulationstation)
