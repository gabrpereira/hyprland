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

 ESSE SCRIPT VAI INSTALAR E CONFIGURAR OS APLICATIVOS QUE USO NO MEU DIA-A-DIA

===============================================================================

              AGORA VAMOS INSTALAR OS PROGRAMAS NECESSARIOS
      
\e[0m"

# Apps
sudo pacman -Sy firefox fish waybar hyprland neovim kitty grim noto-fonts-cjk otf-font-awesome slurp

# Config
echo "Clonando meu repositório com meus arquivos de configuração"

git clone https://github.com/adotive/kitty ~/.config/kitty
git clone https://github.com/adotive/hypr ~/.config/hypr
git clone https://github.com/adotive/waybar ~/.config/waybar

# Prompt
curl -sS https://starship.rs/install.sh | sh

# Yay
echo "Instalar o Yay (AUR Helper)"
git clone https://aur.archlinux.org/yay.git ~/.config/yay
cd .config/yay
makepkg -si 

# GRUB-THEME
git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes
cd Top-5-Bootloader-Themes
sudo ./install.sh
cd ..
sudo rm -r /Top-5-Bootloader-Themes

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

# Adicionar o Startship ao fish

linha_a_adicionar="starship init fish | source"

# Caminho para o arquivo de configuração do Fish Shell
arquivo_config_fish="$HOME/.config/fish/config.fish"

# Verifique se o arquivo de configuração existe antes de adicionarmos a linha
if [ -f "$arquivo_config_fish" ]; then
  # Verifique se a linha já existe no arquivo antes de adicioná-la novamente
  if ! grep -qF "$linha_a_adicionar" "$arquivo_config_fish"; then
    # Adicione a linha ao arquivo de configuração
    echo "$linha_a_adicionar" >> "$arquivo_config_fish"
    echo "Linha adicionada com sucesso ao arquivo de configuração do Fish Shell."
  else
    echo "A linha já existe no arquivo de configuração do Fish Shell."
  fi
else
  echo "O arquivo de configuração do Fish Shell não foi encontrado em $arquivo_config_fish."
fi

# Contador de 5 segundos antes de reiniciar
for i in {5..1}; do
  echo -e "\e[1;31mReiniciando em $i segundo(s)... Pressione Ctrl+C para cancelar\e[0m"
  sleep 1
done

echo -e "\e[1;31mReiniciando agora...\e[0m"
reboot
