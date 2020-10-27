#!/bin/sh
cd
cd RetroPie/retropiemenu
sudo rm -R konami
git clone https://github.com/CrashCortez/konami
cd konami
sudo chmod 777 Update.sh
sudo chmod a+x Update.sh
cd boxart
sudo chmod 777 *.sh
sudo chmod a+x *.sh
cd .full
sudo chmod 777 *.sh
sudo chmod a+x *.sh
cd ..
cd full
sudo chmod 777 *.sh
sudo chmod a+x *.sh
cd ..
cd .hacks
sudo chmod 777 *.sh
sudo chmod a+x *.sh
cd ..
cd hacks
sudo chmod 777 *.sh
sudo chmod a+x *.sh
cd
cd RetroPie/retropiemenu/konami
sudo chmod a+x *.sh
touch /tmp/es-restart && kill -15 $(pidof emulationstation) now
