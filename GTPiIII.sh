#################################################################################################################
# This script assumes that you have the desktop installed, made the Two folders in ports, that you own the PC game files, and that you  
# have placed them in /home/pi/RetroPie/roms/ports/GTA3/GrandTheftAuto3.
# 
# If you need to make the folders you can use the following commands with out the #
#
# mkdir -p ~/RetroPie/roms/ports/GTA3
# mkdir -p ~/RetroPie/roms/ports/GTA3/GrandTheftAuto3
# 
# If you need the game files they can be purchased from Steam and GoG
#
# Get the PC Game Files and put them in /home/pi/RetroPie/roms/ports/GTA3/GrandTheftAuto3
#
# notes taken from https://www.thomaslaurenson.com/blog/2021-03-05/gta3-on-the-retropie/
################################################################################################################

#!/bin/bash

##########################
# Creating Foldes
##########################

#mkdir -p ~/RetroPie/roms/ports/GTA3
#mkdir -p ~/RetroPie/roms/ports/GTA3/GrandTheftAuto3

##########################
# Getting Files and Dependancies
##########################

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

##########################
# Building and Installing Re3
##########################

wget https://github.com/premake/premake-core/archive/v5.0.0-alpha15.tar.gz
tar xvf v5.0.0-alpha15.tar.gz
cd premake-core-5.0.0-alpha15/
make -f Bootstrap.mak linux
cd bin/release
cp premake5 ~/RetroPie/roms/ports/GTA3/re3/premake5LinuxArm

cd ~/RetroPie/roms/ports/GTA3/re3
./premake5LinuxArm --with-librw gmake2
cd build
make config=release_linux-arm64-librw_gl3_glfw-oal

##########################
# Realocating Files
##########################

cd
cp ~/RetroPie/roms/ports/GTA3/re3/bin/linux-arm64-librw_gl3_glfw-oal/Release/re3 ~/RetroPie/roms/ports/GTA3/GrandTheftAuto3/
cd ~/RetroPie/roms/ports/GTA3/re3
cp -r gamefiles/* ~/RetroPie/roms/ports/GTA3/GrandTheftAuto3/

##########################
# Create Port entry
##########################

cd ~/RetroPie/roms/ports

wget https://raw.githubusercontent.com/CrashCortez/konami/main/gta3.sh

chmod u+x re3.sh

##########################
# Edit the re3.ini file
##########################


cd ~/RetroPie/roms/ports/GTA3/GrandTheftAuto3
wget https://raw.githubusercontent.com/CrashCortez/konami/main/re3.ini


# Find the [VideoMode] and change it like so

#[VideoMode]
#Depth = 32
#Height = 480
#Width = 640
#Windowed = 0

wait 15
sudo reboot

# Uses the following to edit the re3.ini file with the above without the #
# nano ~/RetroPie/roms/ports/GTA3/GrandTheftAuto3/re3.ini

##########################
# Test
##########################

#cd ~/RetroPie/roms/ports/GTA3/GrandTheftAuto3
#startx ./re3

##########################
# If desktop is not installed on your retropie build used instaill that folloing
##########################

# sudo apt-get install --no-install-recommends xserver-xorg
# sudo apt-get install --no-install-recommends xinit









