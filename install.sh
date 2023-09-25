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
echo "Vamos instalar alguns programas"

sudo pacman -Sy firefox zsh waybar hyprland neovim kitty

# Config
echo "Clonando meu repositório com meus arquivos de configuração"

git clone https://github.com/adotive/kitty ~/.config/kitty
git clone https://github.com/adotive/waybar ~/.config/waybar
mkdir $HOME/pix 
mkdir $HOME/dos
curl -sS https://starship.rs/install.sh | sh

# Yay
echo "Instalar o Yay (AUR Helper)"
git clone https://aur.archlinux.org/yay.git ~/.config/yay
cd .config/yay
makepkg -si 
clear

# Finalização
sudo rm install.sh
cd
script_dir=$(dirname "$0")  # Obtém o diretório do script
sudo rm "$0"                # Remove o próprio script
cd "$script_dir"/..         # Navega para o diretório pai do diretório do script
sudo rm -r "$script_dir"     # Remove o diretório do script

echo -ne "
=========================================================================================================

████████╗██╗   ██╗██████╗  ██████╗     ██████╗ ██████╗  ██████╗ ███╗   ██╗████████╗ ██████╗ ██╗       ██╗ 
╚══██╔══╝██║   ██║██╔══██╗██╔═══██╗    ██╔══██╗██╔══██╗██╔═══██╗████╗  ██║╚══██╔══╝██╔═══██╗██║    ██╗╚██╗
   ██║   ██║   ██║██║  ██║██║   ██║    ██████╔╝██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║██║    ╚═╝ ██║
   ██║   ██║   ██║██║  ██║██║   ██║    ██╔═══╝ ██╔══██╗██║   ██║██║╚██╗██║   ██║   ██║   ██║╚═╝    ██╗ ██║
   ██║   ╚██████╔╝██████╔╝╚██████╔╝    ██║     ██║  ██║╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝██╗    ╚═╝██╔╝
   ╚═╝    ╚═════╝ ╚═════╝  ╚═════╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝       ╚═╝ 

=========================================================================================================                                                                                                                                                                                                                    
"                                                                                                                                                                                   
cd    
echo "Agora vamos reiniciar o computador com o sistema prontinho pra ser usado"
reboot

