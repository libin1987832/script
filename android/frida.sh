docker pull txt3rob/frida-docker
sudo docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb  -v /home/lb/:/root/lb  -P txt3rob/frida-docker
