clear
echo
echo Motion Blue GPIO SHutdown Script Utility

echo
echo
echo This script will allow you to enable or disable the shutdown script that uses the GPIO pins.
echo
echo If enabled,  wire any momentary pushbutton to GPIO pins 5 and 6.
echo 
echo Pressing the button will power on and off the Raspberry Pi.
echo

echo Please make your selection below.
echo
echo 1. enable GPIO shutdown script
echo 2. disable GPIO shutdown script
echo

read -p "Enter the number and press <enter> : " useranswer

echo
echo "You have chosen option ${useranswer}."
echo "....processing...."
sleep 5

if [[ $useranswer == "1" ]]; then
sudo perl -pi -w -e 's/\#sudo python \/home\/pi\/scripts\/shutdown.py/sudo python \/home\/pi\/scripts\/shutdown.py/g;' /etc/rc.local
else
sudo perl -pi -w -e 's/sudo python \/home\/pi\/scripts\/shutdown.py/\#sudo python \/home\/pi\/scripts\/shutdown.py/g;' /etc/rc.local
fi

echo
echo
echo Script is now finished........
echo
echo You must reboot your Raspberry Pi in order for the change to take effect.
echo
sleep 5
