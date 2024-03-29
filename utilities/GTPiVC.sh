#################################################################################################################
# This script assumes that you have made the Two folders in ports, that you own the PC game files, and that you  
# have placed them in /home/pi/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity.
# 
# If you need to make the folders you can use the following commands
#
# mkdir -p ~/RetroPie/roms/ports/gtavc
# mkdir -p ~/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity
# 
# If you need the game files they can be perchaced from Steam and GoG
#
# Get the PC Game Files and put them in /home/pi/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity
#
# notes taken from https://www.thomaslaurenson.com/blog/2021-03-05/gta3-on-the-retropie/
################################################################################################################

#!/bin/bash

##########################
# Creating Foldes
##########################

#mkdir -p ~/RetroPie/roms/ports/gtavc
#mkdir -p ~/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity

##########################
# Getting Files and Dependancies
##########################

cd ~/RetroPie/roms/ports/gtavc

git clone --recursive -b miami https://github.com/td512/re3.git reVC

sudo apt install libopenal-dev
sudo apt install libglew-dev

wget https://github.com/glfw/glfw/archive/3.3.2.tar.gz
tar xvf 3.3.2.tar.gz 
cd glfw-3.3.2/
cmake .
cmake -DBUILD_SHARED_LIBS=ON .
sudo make install

cd ~/RetroPie/roms/ports/gtavc

sudo apt install libsndfile1-dev
sudo apt install libmpg123-dev

##########################
# Building and Installing ReVc
##########################

wget https://github.com/premake/premake-core/archive/v5.0.0-alpha15.tar.gz
tar xvf v5.0.0-alpha15.tar.gz
cd premake-core-5.0.0-alpha15/
make -f Bootstrap.mak linux
cd bin/release
cp premake5 ~/RetroPie/roms/ports/gtavc/reVC/premake5LinuxArm

cd ~/RetroPie/roms/ports/gtavc/reVC
./premake5LinuxArm --with-librw gmake2
cd build
make config=release_linux-arm-librw_gl3_glfw-oal

##########################
# Realocating Files
##########################

cd
cp ~/RetroPie/roms/ports/gtavc/reVC/bin/linux-arm-librw_gl3_glfw-oal/Release/re3 ~/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity/
cd ~/RetroPie/roms/ports/gtavc/reVC
cp -r gamefiles/* ~/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity/

##########################
# Create Port entry
##########################

cd ~/RetroPie/roms/ports
touch reVC.sh

sed '1 i #!/bin/bash' reVC.sh
sed '2 i cd ~/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity' reVC.sh
sed '3 i startx ./re3' reVC.sh

#sed -i  '#!/bin/bash
#cd ~/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity
#startx ./re3' reVC.sh

chmod u+x reVC.sh

##########################
# Edit the reVC.ini file
##########################

print
ptint Find the [VideoMode] and change it like so
print 
print [VideoMode]
print Depth = 32
print Height = 480
print Width = 640
print Windowed = 0
print
print

wait 15

nano ~/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity/reVC.ini

##########################
# Test
##########################

cd ~/RetroPie/roms/ports/gtavc/GrandTheftAutoViceCity
startx ./reVC

##########################
# If desktop is not installed on your retropie build used instaill that following
##########################

# sudo apt-get install --no-install-recommends xserver-xorg
# sudo apt-get install --no-install-recommends xinit


https://gitgud.io/kostas/re3/-/tree/reVC_1.0








