#!/bin/bash -u

#Get updates and upgrade all packages to the last version before install any other software
sudo apt update
sudo apt upgrade -y

#Get Google Chrome Repository 
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

#Get Telegram Repository
sudo add-apt-repository ppa:atareao/telegram

#Add the Spotify repository signing keys and Repository
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

#Get Key for SublimeText 3 and add Repository
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

#Add TeXstudio repository and install latex
sudo apt install texlive-full
sudo apt install texstudio
sudo apt-get install texlive-lang-spanish

#Add Java 9 Repository
sudo add-apt-repository ppa:webupd8team/java

#Update data of Repositories
sudo apt-get update

#Install all programs above
sudo apt-get install google-chrome-stable -y
sudo apt install flex -y
sudo apt install bison -y
sudo apt-get install telegram -y
sudo apt-get install spotify-client -y
sudo apt-get install sublime-text -y
sudo apt-get install texstudio -y
sudo apt-get install oracle-java9-installer -y

#Setup Java enviornment
sudo apt-get install oracle-java9-set-default
sudo cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-9-oracle
JRE_HOME=/usr/lib/jvm/java-9-oracle/jre
EOL

#Cleaning files
sudo apt-get autoclean
sudo apt autoclean
sudo apt autoremove