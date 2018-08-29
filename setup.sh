#!/bin/bash -u

# Instalar curl para poder añadir todos los repositorios (no viene por defecto en la instalación mínima de Ubuntu)
sudo apt -y install curl


# Repositorio para Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Repositorio para Atom
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

# Repositorio para Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Repositorio para Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Actualizar paquetes
sudo apt update
sudo apt -y upgrade


# Instalar los programas
sudo apt -y install google-chrome-stable
sudo apt -y install texstudio texlive-base texlive-lang-spanish texlive-latex-extra cm-super
sudo apt -y install telegram-desktop
sudo apt -y install spotify-client
sudo apt -y install openjdk-8-jre openjdk-8-jre-dcevm openjdk-8-dbg openjdk-8-jre-headless openjdk-8-demo openjdk-8-jre-zero openjdk-8-doc openjdk-8-source openjdk-8-jdk openjdk-8-jdk-headless
sudo apt -y install git gcc g++ vim
sudo apt -y install atom code
sudo apt -y install net-tools
#Paquetes para GitKraken
sudo apt -y install libgnome-keyring-common libgnome-keyring0
#Paquetes para Discord
sudo apt -y install libappindicator1 libc++1 libc++abi1 libindicator7


# Instalar GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
rm gitkraken-amd64.deb

# Instalar Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
rm discord.deb


# Limpieza de ficheros
sudo apt autoclean
sudo apt clean all
sudo apt autoremove
