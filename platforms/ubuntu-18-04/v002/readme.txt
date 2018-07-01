sudo apt update
sudo apt upgrade


--firefox--
configure firefox


--dock--
remove icons from dock
change size of dock
add other icons to dock
autohide dock
put dock on bottom


--power--
auto brightness OFF


--chrome--
download .deb and click
title bar: use system


--gnome tweaks--
install from software center
remove trash from desktop
make 5 static workspaces


--wallpaper--
set wallpaper


--nautilus--
set folder bookmarks


--git--
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
~/.gitconfig


--vim--
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
https://github.com/junegunn/vim-plug
# install script for vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
~/.vimrc
:PlugInstall


--zsh--
sudo apt install zsh
https://ohmyz.sh/
clone https://github.com/zsh-users/zsh-syntax-highlighting to /home/chyld/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
clone https://github.com/zsh-users/zsh-autosuggestions to /home/chyld/.oh-my-zsh/custom/plugins/zsh-autosuggestions
~/.zshrc
git clone https://github.com/powerline/fonts to ~/.fonts/powerline
gnome terminal: space mono 11 (font) tango dark (theme) hidden toolbar (in global config)
# to change the padding on gnome terminal
vi /home/chyld/.config/gtk-3.0/gtk.css
======================================================
VteTerminal,
TerminalScreen,
vte-terminal {
    padding: 10px 10px 10px 10px;
    -VteTerminal-inner-border: 10px 10px 10px 10px;
}
======================================================
gnome terminal themes: http://mayccoll.github.io/Gogh/


--python--
https://conda.io/miniconda.html
~/.local/apps/miniconda3
chmod -R 500 miniconda3 # the entire directory is read-only
conda create -n p37 python=3.7 # create new environment ~/.conda/envs


--node--
https://nodejs.org/en/
~/.local/apps/node


--system--
sudo apt install tree htop build-essential neofetch tmux sqlite3 curl silversearcher-ag
pip install -U httpie glances


--extensions--
sudo apt install chrome-gnome-shell
https://extensions.gnome.org/
* user themes
* hide top bar


--vscode--
download and click
https://github.com/tonsky/FiraCode to ~/.fonts
install extensions
configure .json file


--hyper--
download .deb file
~/.hyper.js


--virtualbox--
download *.deb file
install extension


--etcher--
make bootable usb drives
https://etcher.io/
move app_image to ~/.local/apps/images/etcher
chmod +x app_image
run and enable desktop integration # shows up in search


--customization--
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

~/.themes
~/.fonts
~/.icons (for cursors too)

--fonts--
/etc/fonts/fonts.conf # config file for all fonts
* /usr/share/fonts
* /usr/local/share/fonts
* ~/.fonts
fc-cache -fv # to clear font cache
sudo fc-cache -fv # to clear font cache
fc-list # show all installed fonts
Install "Font Manager" from Store
monaco font : wget wget http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf
https://www.fontspring.com/account/fonts # my fonts (installing 2 myriad fonts causes render issues)

# view and set gnome details from terminal
gsettings list-recursively org.gnome.desktop.interface
gsettings set org.gnome.desktop.interface font-name 'Myriad Pro Light 11'


--icons--
macos sierra https://www.opendesktop.org/p/1210856/

--cusors--
capitaine https://www.opendesktop.org/p/1148692/

--themes--
Vimix-Gtk-Theme https://www.opendesktop.org/p/1013698/

--background--
wallpaper
lock screen
login screen
user profile icon

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
