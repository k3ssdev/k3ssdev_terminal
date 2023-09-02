# Introducción

Configuración de terminal kitty con powerlevel10 y tema de HackTheBox.

## Descripción

Este repositorio está diseñado para simplificar la configuración de Kali Linux y las herramientas que uso regularmente. Incluye un script que realiza las siguientes acciones:

- Descarga fuentes MesloLGS en ~/Downloads.
- Instala Kitty como el terminal predeterminado.
- Instala powerlevel10k para mejorar la apariencia de la terminal.
- Configura temas de Kitty en ~/.config/kitty/.
- Copia los archivos .zshrc, .p10k.zsh y kitty.conf en sus ubicaciones correspondientes.
- Instala rubygems-integration, betterlockscreen, colorls y lsd.

## Instrucciones de Uso

1. Clona este repositorio en tu sistema:

   ```bash
   git clone https://github.com/k3ssdev/zsh_p10k_config
   ```

2. Navega al directorio del repositorio:

   ```bash
   cd zsh_p10k_config
   ```

3. Ejecuta el script para automatizar la instalación y configuración:

   ```bash
   chmod +x instasll.sh
   ./install.sh
   ```

4. Sigue las instrucciones proporcionadas por el script.

## Requisitos

Asegúrate de tener instalado Git. También necesitarás permisos de administrador para ejecutar ciertas partes del script.

## Licencia

Este proyecto está bajo la [Licencia MIT](LICENSE).


## Fuentes
Config files from https://github.com/AlvinPix/dotfiles 
