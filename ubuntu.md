### Virtual Box Guest Additions

```
sudo mount /dev/cdrom /media/cdrom
cd /media/cdrom
sudo ./VBoxLinuxAdditions.run
sudo reboot

sudo usermod -a -G vboxsf chyld
cd ~
ln -s /media/sf_Temp temp
```  

### Static Network Adapter

```
ifconfig
sudo vi /etc/network/interfaces
```

```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
address 192.168.56.2
network 192.168.56.0
netmask 255.255.255.0
broadcast 192.168.56.255
```

### Git Install

```
mkdir download
cd download/
wget https://www.kernel.org/pub/software/scm/git/git-2.5.0.tar.gz
tar -xzvf git-2.5.0.tar.gz
cd git-2.5.0/
cat INSTALL

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install build-essential libssl-dev libcurl4-openssl-dev libexpat1-dev gettext asciidoc docbook2x

make prefix=/usr/local/git all doc info ;
sudo make prefix=/usr/local/git install install-doc install-html install-info ;
```
