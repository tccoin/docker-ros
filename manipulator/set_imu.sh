# ref: https://blog.csdn.net/qq_31329259/article/details/112232180

echo "ATTRS{idVendor}==\"10c4\", ATTRS{idProduct}==\"ea60\", ATTRS{serial}==\"02228943\", MODE:=\"0777\",SYMLINK+=\"usbimu1\"\nATTRS{idVendor}==\"10c4\", ATTRS{idProduct}==\"ea60\", ATTRS{serial}==\"02228922\", MODE:=\"0777\",SYMLINK+=\"usbimu2\"" | sudo tee /etc/udev/rules.d/usb_imu.rules > /dev/null

sudo service udev reload && sudo service udev restart