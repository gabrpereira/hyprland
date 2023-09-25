#!/bin/sh

setfont ter-v22b
clear
echo -e "\e[1;34m
===============================================================================

██████╗ ███████╗███╗   ███╗    ██╗   ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗██╗██╗
██╔══██╗██╔════╝████╗ ████║    ██║   ██║██║████╗  ██║██╔══██╗██╔═══██╗██║██║██║
██████╔╝█████╗  ██╔████╔██║    ██║   ██║██║██╔██╗ ██║██║  ██║██║   ██║██║██║██║
██╔══██╗██╔══╝  ██║╚██╔╝██║    ╚██╗ ██╔╝██║██║╚██╗██║██║  ██║██║   ██║╚═╝╚═╝╚═╝
██████╔╝███████╗██║ ╚═╝ ██║     ╚████╔╝ ██║██║ ╚████║██████╔╝╚██████╔╝██╗██╗██╗
╚═════╝ ╚══════╝╚═╝     ╚═╝      ╚═══╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ ╚═╝╚═╝╚═╝
                                                                               
===============================================================================

\e[0m"

# Apps
echo -e "\e[1;32mInstalando aplicativos necessários...\e[0m"
sudo pacman -Sy firefox fish waybar hyprland neovim kitty grim noto-fonts-cjk otf-font-awesome slurp

# Config
echo -e "\e[1;32mClonando meu repositório com meus arquivos de configuração...\e[0m"
git clone https://github.com/adotive/kitty ~/.config/kitty
git clone https://github.com/adotive/hypr ~/.config/hypr
git clone https://github.com/adotive/waybar ~/.config/waybar

# Prompt
echo -e "\e[1;32mInstalando o prompt Starship...\e[0m"
curl -sS https://starship.rs/install.sh | sh

# Yay
echo -e "\e[1;32mInstalando o Yay (AUR Helper)...\e[0m"
git clone https://aur.archlinux.org/yay.git ~/.config/yay
cd ~/.config/yay
makepkg -si 

# GRUB-THEME
echo -e "\e[1;32mInstalando o GRUB Theme...\e[0m"
git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes
cd Top-5-Bootloader-Themes
sudo ./install.sh
cd ..
sudo rm -r Top-5-Bootloader-Themes

# Finalização
sudo rm install.sh
cd ..
sudo rm -r $HOME/hyprland
clear

echo -e "\e[1;34m
==========================================================================================================
████████╗██╗   ██╗██████╗  ██████╗     ██████╗ ██████╗  ██████╗ ███╗   ██╗████████╗ ██████╗ ██╗       ██╗ 
╚══██╔══╝██║   ██║██╔══██╗██╔═══██╗    ██╔══██╗██╔══██╗██╔═══██╗████╗  ██║╚══██╔══╝██╔═══██╗██║    ██╗╚██╗
   ██║   ██║   ██║██║  ██║██║   ██║    ██████╔╝██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║██║    ╚═╝ ██║
   ██║   ██║   ██║██║  ██║██║   ██║    ██╔═══╝ ██╔══██╗██║   ██║██║╚██╗██║   ██║   ██║   ██║╚═╝    ██╗ ██║
   ██║   ╚██████╔╝██████╔╝╚██████╔╝    ██║     ██║  ██║╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝██╗    ╚═╝██╔╝
   ╚═╝    ╚═════╝ ╚═════╝  ╚═════╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝       ╚═╝ 
==========================================================================================================                                                                                                                                                                                                          

\e[0m"
cd $HOME  
chsh -s $(which fish)


linha_a_adicionar="starship init fish | source"

arquivo_config_fish="$HOME/.config/fish/config.fish"

if [ -f "$arquivo_config_fish" ]; then
  if ! grep -qF "$linha_a_adicionar" "$arquivo_config_fish"; then
    echo "$linha_a_adicionar" >> "$arquivo_config_fish"
    echo -e "\e[1;32mStarship agora faz parte do Fish! :)\e[0m"
  else
    echo -e "\e[1;33mA linha já existe no arquivo de configuração do Fish Shell.\e[0m"
  fi
else
  echo -e "\e[1;33mO arquivo de configuração do Fish Shell não foi encontrado em $arquivo_config_fish.\e[0m"
fi
clear

# Contador de 5 segundos antes de reiniciar
for i in {5..1}; do
  echo -e "\e[1;31mReiniciando em $i segundo(s)... Pressione Ctrl+C para cancelar\e[0m"
  sleep 1
done

echo -e "\e[1;31mReiniciando agora...\e[0m"
reboot
