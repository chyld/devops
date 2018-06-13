# readme ubuntu

### install

- insert usb stick
- reboot
- disk space installation options
  - /dev/sda3
  - 300GB
  - format ext4
  - device for "boot loader installation" = /dev/sda3
- after install press enter or CTRL+C to reboot

### post-install

- remove unused icons
- move trash icon
- pin chrome, firefox, finder, terminal, hyper, vscode, settings, software
- sudo apt update & upgrade
- wallpaper
- set lock screen wallpaper
- icon resize
- install chrome, hyper, vscode
- set firefox homepage
- change login avatar: Settings -> Details -> Users
- add Gnome Tweaks tool
- https://extensions.gnome.org/extension/307/dash-to-dock/
- you cannot have 2 docks, so after configuring dash to dock, disable it, it remembers settings
- hide trash can from desktop
- change border width of hyperborder to 2px
- vi .hyper_plugins/node_modules/hyperborder/index.js
- get 'hide top bar' gnome extension
- change theme to arc-theme
- use numix icons
- paper icons and cursor https://snwh.org/paper/download
- macos cursor https://github.com/keeferrourke/capitaine-cursors
- sudo apt install tilix # customize profile settings
- sudo apt install ranger # vim-based file explorer
- sudo apt install neofetch figlet cmatrix lolcat # make it fun!
- theme https://www.gnome-look.org/p/1013698/ or https://www.opendesktop.org/p/1013698
- download vimix-color-dark, extract and run sudo ./Install
- copies files to /usr/share/themes
- set static number of workspaces to 4

### change login screen

- sudo cp hello.jpg to /usr/share/backgrounds/
- sudo vi /etc/alternatives/gdm3.css

```
#lockDialogGroup {
 background: #2c001e url(file:///usr/share/backgrounds/hello.jpg);
 background-repeat: no-repeat;
 background-size: cover;
 background-position: center;
 }
```

### git

- sudo add-apt-repository ppa:git-core/ppa
- sudo apt-get update
- sudo apt-get install git

### node

- https://nodejs.org/en/download/current/
- ~/.local/apps/node

### miniconda

- https://conda.io/miniconda.html
- ~/.local/apps/miniconda3

### apt

- sudo apt install htop tree neofetch chrome-gnome-shell iotop iftop build-essential tmux arc-theme numix-icon-theme sqlite3
- pip install glances

### python

- make base conda env read-only
- after installing miniconda to ~/.local/apps/miniconda3
- cd lib/python3.6
- chmod 500 site-packages
- when opening vscode, remember to switch to the correct env, by clicking on bottom left icon
- when installing packages using conda, you can specify a channel, as below
- conda install -c conda-forge jupyterlab

### optional switch control and command keys

```
switch command and control keys
vi /usr/share/X11/xkb/symbols/pc
change lines 25 to 31

make 2 control keys on the left, but normal keys on the right.

key <LFSH> {	[ Shift_L		]	};
key <LCTL> {	[ Control_L		]	};
key <LWIN> {	[ Super_L		]	};

key <RTSH> {	[ Shift_R		]	};
key <RCTL> {	[ Control_R		]	};
key <RWIN> {	[ Super_R		]	};
```

### settings

- disable automatic screen brightness
- settings -> power
- chrome : system title and border

### zsh

- sudo apt install zsh
- chsh
- /usr/bin/zsh
- reboot (verify zsh)
- download http://ohmyz.sh/
- edit ~/.zshrc

  - add aliases
  - DEFAULT_USER=chyld
  - ZSH_THEME="agnoster"

- plugins

  - /home/chyld/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  - /home/chyld/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  - https://github.com/zsh-users/zsh-syntax-highlighting
  - https://github.com/zsh-users/zsh-autosuggestions
  - update ~/.zshrc plugins section

- theme https://denysdovhan.com/spaceship-prompt/
- cd ~/.fonts
- git clone https://github.com/powerline/fonts
- hyper config (partial)

```
fontSize: 13,
fontFamily: '"Fira Mono for Powerline", Menlo, ...'
plugins: ["hypercwd", "hyper-materialshell", "hyperborder", "gitrocket", "space-pull"],
```

### vscode

- get vscode settings
- install firacode font in ~/.fonts directory
- plugins
  - prettier
  - python
  - quokka.js
  - rainbow csv

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
