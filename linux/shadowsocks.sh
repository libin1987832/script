#apt-get install pip
#pip install setuptool
#Fpip install shadowsocks
apt-get install shadowsocks
rm /etc/init.d/ssserver.sh
echo -e "#!/bin/bash\n\nssserver -c ~/shadowsocks.conf" >> /etc/init.d/ssserver.sh
chmod +x /etc/init.d/ssserver.sh
update-rc.d ssserver.sh defaults
/etc/init.d/ssserver.sh

