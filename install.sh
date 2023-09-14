#!/bin/bash

# Instalar fuentes Meslo
mkdir -p ~/.fonts
cp "MesloLGS NF Bold Italic.ttf" ~/.fonts
cp "MesloLGS NF Bold.ttf" ~/.fonts
cp "MesloLGS NF Italic.ttf" ~/.fonts
cp "MesloLGS NF Regular.ttf" ~/.fonts

# Añade fuentes de usuario (en ~/.fonts)
fc-cache -f -v         

# Instalar Kitty como terminal y configurarlo como predeterminado
sudo apt update
sudo apt install kitty -y
#sudo update-alternatives --config x-terminal-emulator

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
sudo apt install rubygems-integration -y
gem install colorls
sudo apt install lsd -y
sudo apt install betterlockscreen -y
sudo apt install lolcat -y
sudo apt install bat -y

# Copiar ficheros .zshrc y configuracion de kitty
cp .zshrc ~/
cp .motd ~/
cp kitty.conf ~/.config/kitty
cp current-theme.conf ~/.config/kitty  

# Reiniciar la terminal para aplicar los cambios
exec zsh

# Abre kitty
kitty&
