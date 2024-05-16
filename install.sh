#!/bin/bash

# Cambiar la shell predeterminada a zsh
chsh -s $(which zsh)

# Función para instalar paquetes en sistemas basados en Debian (apt)
install_debian() {
    sudo apt update
    packages=("kitty" "rubygems-integration" "lsd" "lolcat" "bat" "zsh") # "betterlockscreen"
    for package in "${packages[@]}"; do
        sudo apt install -y "$package" || echo "No se pudo instalar $package, continuando con el siguiente..."
    done
    gem install colorls || echo "No se pudo instalar colorls"
}

# Función para instalar paquetes en sistemas basados en Arch (pacman)
install_arch() {
    sudo pacman -Syu --noconfirm
    packages=("kitty" "rubygems" "lsd" "lolcat" "bat" "zsh") # "betterlockscreen"
    for package in "${packages[@]}"; do
        sudo pacman -S --noconfirm "$package" || echo "No se pudo instalar $package, continuando con el siguiente..."
    done
    gem install colorls || echo "No se pudo instalar colorls"
}

# Leer y analizar el archivo /etc/os-release para determinar la distribución
if grep -qi 'debian' /etc/os-release; then
    # Sistema basado en Debian (Ubuntu, etc.)
    install_debian
elif grep -qi 'arch' /etc/os-release; then
    # Sistema basado en Arch (Manjaro, etc.)
    install_arch
else
    echo "Sistema operativo no compatible."
    exit 1
fi


# Instalar fuentes Meslo
mkdir -p ~/.fonts
cp "MesloLGS NF Bold Italic.ttf" ~/.fonts
cp "MesloLGS NF Bold.ttf" ~/.fonts
cp "MesloLGS NF Italic.ttf" ~/.fonts
cp "MesloLGS NF Regular.ttf" ~/.fonts

# Añade fuentes de usuario (en ~/.fonts)
fc-cache -f -v

# Instalar Kitty como terminal y configurarlo como predeterminado
#sudo update-alternatives --config x-terminal-emulator

# Instalar powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Instalar themes de Kitty en ~/.config/kitty/
mkdir -p ~/.config/kitty
git clone https://github.com/kovidgoyal/kitty-themes.git ~/.config/kitty/

# Instalar colorscripts
git clone https://github.com/k3ssdev/shell-color-scripts.git ~/shell-color-scripts
chmod +x ~/shell-color-scripts/colorscript.sh

# Copiar ficheros .zshrc y configuracion de kitty
cp .zshrc ~/
cp .motd ~/
cp kitty.conf ~/.config/kitty
cp current-theme.conf ~/.config/kitty

# Añadir zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Reiniciar la terminal para aplicar los cambios
exec zsh

# Abrir kitty
kitty&
