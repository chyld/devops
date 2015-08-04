```sh
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
