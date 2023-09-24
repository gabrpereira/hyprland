#!/bin/sh
clear
echo -ne "
============================================================================

██████╗ ███████╗███╗   ███╗    ██╗   ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗██╗██╗
██╔══██╗██╔════╝████╗ ████║    ██║   ██║██║████╗  ██║██╔══██╗██╔═══██╗██║██║██║
██████╔╝█████╗  ██╔████╔██║    ██║   ██║██║██╔██╗ ██║██║  ██║██║   ██║██║██║██║
██╔══██╗██╔══╝  ██║╚██╔╝██║    ╚██╗ ██╔╝██║██║╚██╗██║██║  ██║██║   ██║╚═╝╚═╝╚═╝
██████╔╝███████╗██║ ╚═╝ ██║     ╚████╔╝ ██║██║ ╚████║██████╔╝╚██████╔╝██╗██╗██╗
╚═════╝ ╚══════╝╚═╝     ╚═╝      ╚═══╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ ╚═╝╚═╝╚═╝
                                                                               

=============================================================================
              AGORA VAMOS INSTALAR OS PROGRAMAS NECESSARIOS
      
"

# Apps
sudo pacman -Sy firefox zsh waybar hyprland neovim kitty

# Config
git clone https://github.com/adotive/kitty ~/.config/kitty
git clone https://github.com/adotive/waybar ~/.config/waybar
mkdir pix 
mkdir dos
curl -sS https://starship.rs/install.sh | sh

# Yay
git clone https://aur.archlinux.org/yay.git ~/.config/yay
cd .config/yay
makepkg -si
cd 
clear
echo -ne "

.dP"Y8 88 .dP"Y8 888888 888888 8b    d8    db        88""Yb 88""Yb  dP"Yb  88b 88 888888  dP"Yb      .o. Yb  
`Ybo." 88 `Ybo."   88   88__   88b  d88   dPYb       88__dP 88__dP dP   Yb 88Yb88   88   dP   Yb     `"'  Yb 
o.`Y8b 88 o.`Y8b   88   88""   88YbdP88  dP__Yb      88"""  88"Yb  Yb   dP 88 Y88   88   Yb   dP     .o.  dP 
8bodP' 88 8bodP'   88   888888 88 YY 88 dP""""Yb     88     88  Yb  YbodP  88  Y8   88    YbodP      `"' dP                                                                                                                                                                               
                                                                                                                                                                                   
"                                                                                                                                                                                   
                                                                                                                                                                               
sudo rm -r arch
