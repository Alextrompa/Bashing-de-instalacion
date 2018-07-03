#!/bin/bash -u

# Repositorio para Telegram
sudo add-apt-repository ppa:atareao/telegram

# Repositorio para Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Repositorio para Atom
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

# Repositorio para Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list


# Actualizar paquetes
sudo apt update
sudo apt -y upgrade


# Instalar los programas
sudo apt -y install google-chrome-stable
sudo apt -y install texstudio texlive-lang-spanish texlive-latex-extra cm-super
sudo apt -y install telegram
sudo apt -y install spotify-client
sudo apt -y install openjdk-9-dbg openjdk-9-jdk-headless openjdk-9-demo openjdk-9-jre openjdk-9-doc openjdk-9-source openjdk-9-jdk openjdk-9-jre-headless
sudo apt -y install git gcc
sudo apt -y install atom

# Instalar GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
dpkg -i gitkraken-amd64.deb
rm gitkraken-amd64.deb

# Instalar Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
rm discord.deb


# Limpieza de ficheros
sudo apt autoclean
sudo apt clean all
sudo apt autoremove
