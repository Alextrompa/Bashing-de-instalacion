#Actualizamos todos los paquetes
sudo dnf -y update

#Habilitamos el repositorio de paquetes RPM Fusion
sudo dnf -y install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core

#Descargamos plugins para música y vídeo
sudo dnf -y install gstreamer1-libav gstreamer1-plugins-bad-free \
       gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras \
       gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-nonfree \
       gstreamer1-plugins-good gstreamer1-plugins-ugly lame-libs lame-libs
sudo dnf -y group upgrade --with-optional Multimedia

#Añadimos el flathub a los repositorios de flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Añadimos el repositorio para Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update

#Descargamos el paquete de idiomas español
sudo dnf -y install hunspell-es-ES

#Instalamos las aplicaciones deseadas
sudo dnf -y install python java-1.8.0-openjdk make meld vim qemu code gcc g++ R telegram-desktop
sudo dnf -y install texstudio texlive-base texlive-collection-latexextra texlive-glossaries-spanish texlive-collection-langspanish

#Instalamos las aplicaciones deseadas
sudo flatpak install flathub com.spotify.Client com.discordapp.Discord

#GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.rpm
sudo rpm -i gitkraken-amd64.rpm
rm gitkraken-amd64.rpm

#RStudio
wget -O rstudio.rpm "https://download1.rstudio.org/desktop/centos8/x86_64/rstudio-1.3.1093-x86_64.rpm"
sudo dnf install -y ./rstudio.rpm
rm rstudio.rpm

#Google Chrome
wget -O googlechrome.rpm "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
sudo dnf install -y ./googlechrome.rpm
rm googlechrome.rpm

#Limpieza de ficheros
sudo dnf -y autoremove
sudo dnf clean all