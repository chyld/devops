# readme ubuntu

### install

* insert usb stick
* reboot
* disk space installation options
  * /dev/sda3
  * 300GB
  * format ext4
  * device for "boot loader installation" = /dev/sda3
* after install press enter or CTRL+C to reboot

### post-install

* remove unused icons
* move trash icon
* pin chrome, firefox, finder, terminal, hyper, vscode, settings, software
* sudo apt update & upgrade
* wallpaper
* icon resize
* install chrome, hyper, vscode
* set firefox homepage

### git

* sudo add-apt-repository ppa:git-core/ppa
* sudo apt-get update
* sudo apt-get install git

### node

* https://nodejs.org/en/download/current/
* ~/.local/apps/node

### miniconda

* https://conda.io/miniconda.html
* ~/.local/apps/miniconda3

### apt

* sudo apt install htop tree neofetch

### optional switch control and command keys

```
switch command and control keys
vi /usr/share/X11/xkb/symbols/pc
change lines 25 to 31

key <LFSH> {	[ Shift_L		]	};
key <LCTL> {	[ Super_L		]	};
key <LWIN> {	[ Control_L		]	};

key <RTSH> {	[ Shift_R		]	};
key <RCTL> {	[ Super_R		]	};
key <RWIN> {	[ Control_R		]	};
```

### settings

* disable automatic screen brightness
* settings -> power
* chrome : system title and border

### zsh

* sudo apt install zsh
* chsh
* /usr/bin/zsh
* reboot (verify zsh)
* download http://ohmyz.sh/
* edit ~/.zshrc
  * add aliases
  * DEFAULT_USER=chyld
  * ZSH_THEME="agnoster"
* cd ~/.fonts
* git clone https://github.com/powerline/fonts
* hyper config (partial)

```
fontSize: 13,
fontFamily: '"Fira Mono for Powerline", Menlo, ...'
plugins: ["hypercwd", "hyper-materialshell", "hyperborder", "gitrocket", "space-pull"],
```

### vscode

* get vscode settings
* install firacode font in ~/.fonts directory
* plugins
  * prettier
  * python
  * quokka.js
  * rainbow csv

### vim

```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

### refind boot manager

```
sudo apt-add-repository ppa:rodsmith/refind
sudo apt update
sudo apt install refind
reboot
```
