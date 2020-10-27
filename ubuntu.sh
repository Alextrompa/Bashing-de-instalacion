#!/bin/bash -u

# Instalar curl para poder añadir todos los repositorios (no viene por defecto en la instalación mínima de Ubuntu)
sudo apt -y install curl

# Repositorio para Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Repositorio para Atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

# Repositorio para Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Actualizar paquetes
sudo apt update
sudo apt -y upgrade


# Instalar los programas
sudo apt -y install texstudio texlive-base texlive-lang-spanish texlive-latex-extra cm-super
#sudo apt -y install telegram-desktop Comprobar esto
sudo apt -y install spotify-client
sudo apt -y install openjdk-8-jre openjdk-8-jre-dcevm openjdk-8-dbg openjdk-8-jre-headless openjdk-8-demo openjdk-8-jre-zero openjdk-8-doc openjdk-8-source openjdk-8-jdk openjdk-8-jdk-headless
sudo apt -y install git gcc g++ vim make meld
sudo apt -y install atom code
sudo apt -y install net-tools
sudo apt -y install rar unrar
#Paquetes para GitKraken
sudo apt -y install libgnome-keyring-common libgnome-keyring0
#Paquetes para Discord
sudo apt -y install libappindicator1 libc++1 libc++abi1 libindicator7

# Instalar Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

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
