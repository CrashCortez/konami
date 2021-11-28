#################################################################################################################
# This script assumes that you have the desktop installed
#
#
################################################################################################################

#!/bin/bash

################################################################################################################
# Creating Foldes
################################################################################################################

mkdir -p ~/RetroPie/roms/ports/GTA3

################################################################################################################
# Getting Files and Dependancies
################################################################################################################

cd ~/RetroPie/roms/ports/GTA3

git clone https://github.com/dmitry64/re3.git

sudo apt install -y libopenal-dev
sudo apt install -y libglew-dev

wget https://github.com/glfw/glfw/archive/3.3.2.tar.gz
tar xvf 3.3.2.tar.gz 
cd glfw-3.3.2/
cmake .
cmake -DBUILD_SHARED_LIBS=ON .
sudo make install

cd ~/RetroPie/roms/ports/GTA3

sudo apt install -y libsndfile1-dev
sudo apt install -y libmpg123-dev

################################################################################################################
# Building and Installing Re3
################################################################################################################

cd ~/RetroPie/roms/ports/GTA3

wget https://archive.org/download/grand-theft-auto-3_202111/GrandTheftAuto3.zip
unzip GrandTheftAuto3.zip

sudo rm -f GrandTheftAuto3.zip

################################################################################################################
# Create Port entry
################################################################################################################

cd ~/RetroPie/roms/ports

wget https://raw.githubusercontent.com/CrashCortez/konami/main/gta3.sh

chmod u+x re3.sh

################################################################################################################
# Edit the re3.ini file
################################################################################################################

cd ~/RetroPie/roms/ports/GTA3/GrandTheftAuto3
sudo rm -f re3.ini
wget https://raw.githubusercontent.com/CrashCortez/konami/main/re3.ini

################################################################################################################
# Done Rebooting
################################################################################################################
sudo reboot





