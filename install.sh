#!/bin/bash

# Copiar fichero .zshrc, .p10k.zsh y kitty.conf del repositorio en las carpetas correspondientes
cp .zshrc ~/
cp .p10k.zsh ~/
cp kitty.conf ~/.config/kitty/
cp current-theme.conf ~/.config/kitty/


# Instalar Kitty como terminal y configurarlo como predeterminado
sudo apt-get update
sudo apt-get install kitty -y
sudo update-alternatives --config x-terminal-emulator

# Instalar powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Instalar themes de Kitty en ~/.config/kitty/
mkdir -p ~/.config/kitty

git clone https://github.com/kovidgoyal/kitty-themes.git ~/.config/kitty/

# Instalar colorscripts
git clone https://github.com/k3ssdev/shell-color-scripts.git ~/shell-color-scripts
chmod +x ~/shell-color-scripts/coloscript.sh

# Instalar rubygems-integration, betterlockscreen, colorls y lsd
sudo apt-get install rubygems-integration -y
gem install colorls
sudo apt-get install lsd -y
sudo apt-get install betterlockscreen -y

# Descargar las fuentes MesloLGS en ~/Downloads
mkdir -p ~/Downloads
cd ~/Downloads
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Reiniciar la terminal para aplicar los cambios
exec zsh
