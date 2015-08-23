### Virtual Box Setup
![VirtualBox](https://raw.githubusercontent.com/chyld/devops/master/images/vm1.png)

### Virtual Box Network
![Network](https://raw.githubusercontent.com/chyld/devops/master/images/vm2.png)

### Virtual Box Shared Folders
![Shared Folder](https://raw.githubusercontent.com/chyld/devops/master/images/vm3.png)

### Virtual Box Host Adapter and Configuration
![Host Adapter](https://raw.githubusercontent.com/chyld/devops/master/images/vm4.png)

##### Host Adapter Config 1
![Host Adapter 1](https://raw.githubusercontent.com/chyld/devops/master/images/vm5.png)

##### Host Adapter Config 2
![Host Adapter 2](https://raw.githubusercontent.com/chyld/devops/master/images/vm6.png)

### Virtual Box Extensions
![Extensions](https://raw.githubusercontent.com/chyld/devops/master/images/vm7.png)

### Virtual Box Guest Additions

```
sudo mount /dev/cdrom /media/cdrom
cd /media/cdrom
sudo ./VBoxLinuxAdditions.run
sudo reboot

sudo usermod -a -G vboxsf chyld
cd ~
ln -s /media/sf_Temp temp
- or -
sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Code /home/chyld/code
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

### Python Install

```
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo python3 get-pip.py

pip2 list
pip3 list

ll /usr/local/bin

sudo pip2 install httpie
```

### Node Install

```
wget https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz
tar -xzvf node-v0.12.7-linux-x64.tar.gz
sudo mv node-v0.12.7-linux-x64 /usr/local/node
```

### Ruby Install

```
sudo apt-get install curl
```

http://rvm.io/rvm/install

```
gem install pry
```

### Git Install

Quick - No Docs

```
mkdir download
cd download/
wget https://www.kernel.org/pub/software/scm/git/git-2.5.0.tar.gz
tar -xzvf git-2.5.0.tar.gz
cd git-2.5.0/
cat INSTALL

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install build-essential libssl-dev libcurl4-openssl-dev libexpat1-dev

make prefix=/usr/local/git all
sudo make prefix=/usr/local/git install
```

Long - With Docs

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

### CouchDB Install

```
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:couchdb/stable -y
sudo apt-get update -y
sudo apt-get remove couchdb couchdb-bin couchdb-common -yf
sudo apt-get install -V couchdb
sudo stop couchdb
sudo vi /etc/couchdb/local.ini # bind_address=0.0.0.0
sudo reboot
```

http://192.168.56.2:5984/_utils/index.html

### GUI Applications

- Atom
- Chrome
- UnityTweakTool

### Themes

- https://numixproject.org/

```
sudo apt-add-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle numix-wallpaper-notd
```

### Ubuntu Desktop

- Install VM
- sudo apt-get install update
- sudo apt-get install upgrade
- REBOOT
- Install VMWare Tools
- REBOOT
- Install Python PIP 2/3
- Install Node
- Install Ruby & Rails
- REBOOT
- Install CouchDB
- Install Git (Quick Version)
- REBOOT
- Install Atom, Chrome, Unity Tweak Tool
- Pin Apps to Launcher
- Change Icon Size
- Add workspaces
- Turn off auto logoff
- Add wallpaper
- Disable Launcher & Search Keyboard Shortcuts
- Add Panel Transparency
- Install Numix Theme, Icons, Wallpaper
- REBOOT
- Add dotfiles, vim, tmux
- Add SourceCodePro font (Atom/Terminal)
- https://github.com/chriskempson/base16-gnome-terminal
- http://ciembor.github.io/4bit/#
- Cloud Foundry CLI
- Atom themes & plugins

### Ruby File for adding Gnome Color Schemes

```
Dir.chdir 'base16-gnome-terminal'
`chmod +x *.sh`

Dir.foreach('.') do |item|
  if item.end_with? '.sh'
    cmd = "./#{item}"
    puts cmd
    `#{cmd}`
  end
end
```
