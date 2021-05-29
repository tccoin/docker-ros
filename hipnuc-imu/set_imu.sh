# ref: https://blog.csdn.net/qq_31329259/article/details/112232180

# udevadm info --attribute-walk --name=/dev/usbIMU1
# udevadm info --attribute-walk --name=/dev/ttyUSB0
# udevadm info --attribute-walk --name=/dev/ttyUSB1 | grep devpath


# echo "ATTRS{idVendor}==\"10c4\", ATTRS{idProduct}==\"ea60\", ATTRS{devpath}==\"1.1\", MODE:=\"0777\",SYMLINK+=\"usbIMU1\"\nATTRS{idVendor}==\"10c4\", ATTRS{idProduct}==\"ea60\", ATTRS{devpath}==\"1.4\", MODE:=\"0777\",SYMLINK+=\"usbIMU2\"" | sudo tee /etc/udev/rules.d/usb_imu.rules > /dev/null

sudo cp hipnuc-imu/usb_imu.rules /etc/udev/rules.d/usb_imu.rules

sudo service udev reload && sudo service udev restart

ls /dev/usb*