#!/bin/bash
echo "Hello $USER, I'm gonna wipe a drive for you."
echo "I'll need the letter of your drive."
echo "If your drive is /dev/sda, you would press a followed by enter."
read driveLetter;
clear
echo "Thank you."
echo "We may need your password for use with sudo momentarily."
sleep 2

sudo apt-get update
sudo apt-get install shred

echo "You entered $driveLetter as your usb keys letter."
echo "This is correct?(y/n): "
read ynanswer;
if [[ "$ynanswer" == "n" ]]; then
echo "See ya."
exit 0
elif [[ "$ynanswer" == "y" ]]; then
sudo shred -v -z /dev/sd${driveLetter}
else
echo "You didn't enter a y or an n"
exit 0
fi
sudo apt-get install gparted
nohup sudo nohup gparted &
echo "Use gparted to write a partition table to your device."
exit 0
