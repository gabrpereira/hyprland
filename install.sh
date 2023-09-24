#!/bin/sh
clear
echo -ne "

██████╗░███████╗███╗░░░███╗  ██╗░░░██╗██╗███╗░░██╗██████╗░░█████╗░  ██╗██╗██╗
██╔══██╗██╔════╝████╗░████║  ██║░░░██║██║████╗░██║██╔══██╗██╔══██╗  ██║██║██║
██████╦╝█████╗░░██╔████╔██║  ╚██╗░██╔╝██║██╔██╗██║██║░░██║██║░░██║  ██║██║██║
██╔══██╗██╔══╝░░██║╚██╔╝██║  ░╚████╔╝░██║██║╚████║██║░░██║██║░░██║  ╚═╝╚═╝╚═╝
██████╦╝███████╗██║░╚═╝░██║  ░░╚██╔╝░░██║██║░╚███║██████╔╝╚█████╔╝  ██╗██╗██╗
╚═════╝░╚══════╝╚═╝░░░░░╚═╝  ░░░╚═╝░░░╚═╝╚═╝░░╚══╝╚═════╝░░╚════╝░  ╚═╝╚═╝╚═╝

              AGORA VAMOS INSTALAR OS PROGRAMAS NECESSARIOS
      
"


sudo pacman -Sy firefox zsh waybar hyprland neovim kitty
git clone https://github.com/adotive/kitty ~/.config/kitty
git clone https://github.com/adotive/waybar ~/.config/waybar
mkdir pix 
mkdir dos
curl -sS https://starship.rs/install.sh | sh
git clone https://aur.archlinux.org/yay.git ~/.config/yay
cd .config/yay
makepkg -si
cd 
sudo rm -r arch
