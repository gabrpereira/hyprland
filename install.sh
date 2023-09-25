#!/bin/sh
clear
echo -ne "
===============================================================================

██████╗ ███████╗███╗   ███╗    ██╗   ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗██╗██╗
██╔══██╗██╔════╝████╗ ████║    ██║   ██║██║████╗  ██║██╔══██╗██╔═══██╗██║██║██║
██████╔╝█████╗  ██╔████╔██║    ██║   ██║██║██╔██╗ ██║██║  ██║██║   ██║██║██║██║
██╔══██╗██╔══╝  ██║╚██╔╝██║    ╚██╗ ██╔╝██║██║╚██╗██║██║  ██║██║   ██║╚═╝╚═╝╚═╝
██████╔╝███████╗██║ ╚═╝ ██║     ╚████╔╝ ██║██║ ╚████║██████╔╝╚██████╔╝██╗██╗██╗
╚═════╝ ╚══════╝╚═╝     ╚═╝      ╚═══╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ ╚═╝╚═╝╚═╝
                                                                               
===============================================================================

 ESSE SCRIPT VAI INSTALAR E CONFIGURAR OS APLICATIVOS QUE USO NO MEU DIA-A-DIA

===============================================================================

              AGORA VAMOS INSTALAR OS PROGRAMAS NECESSARIOS
      
"

# Apps
sudo pacman -Sy firefox zsh waybar hyprland neovim kitty

# Config
echo "Clonando meu repositório com meus arquivos de configuração"

git clone https://github.com/adotive/kitty ~/.config/kitty
git clone https://github.com/adotive/waybar ~/.config/waybar
mkdir $HOME/pix 
mkdir $HOME/dos

# Prompt
curl -sS https://starship.rs/install.sh | sh

# Yay
echo "Instalar o Yay (AUR Helper)"
git clone https://aur.archlinux.org/yay.git ~/.config/yay
cd .config/yay
makepkg -si 
clear

# GRUB-THEME
git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes
cd Top-5-Bootloader-Themes
sudo ./install.sh
cd ..
sudo rm /Top-5-Bootloader-Themes

# Finalização
sudo rm install.sh
cd ..
sudo rm -r $HOME/arch
clear

echo -e "\e[1;32m
===============================================================================
████████╗██╗   ██╗██████╗  ██████╗     ██████╗ ██████╗  ██████╗ ███╗   ██╗████████╗ ██████╗ ██╗       ██╗ 
╚══██╔══╝██║   ██║██╔══██╗██╔═══██╗    ██╔══██╗██╔══██╗██╔═══██╗████╗  ██║╚══██╔══╝██╔═══██╗██║    ██╗╚██╗
   ██║   ██║   ██║██║  ██║██║   ██║    ██████╔╝██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║██║    ╚═╝ ██║
   ██║   ██║   ██║██║  ██║██║   ██║    ██╔═══╝ ██╔══██╗██║   ██║██║╚██╗██║   ██║   ██║   ██║╚═╝    ██╗ ██║
   ██║   ╚██████╔╝██████╔╝╚██████╔╝    ██║     ██║  ██║╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝██╗    ╚═╝██╔╝
   ╚═╝    ╚═════╝ ╚═════╝  ╚═════╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝       ╚═╝ 
===============================================================================\e[0m"                                                                                                                                                                                                                

cd $HOME  

# Contador de 5 segundos antes de reiniciar
for i in {5..1}; do
  echo -e "\e[1;31mReiniciando em $i segundo(s)... Pressione Ctrl+C para cancelar\e[0m"
  sleep 1
done

echo -e "\e[1;31mReiniciando agora...\e[0m"
reboot

