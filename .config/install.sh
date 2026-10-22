#!/bin/bash
set -e

echo "Iniciando instalación para el entorno CachyOS (Hyprland)..."

# 1. Actualización inicial del sistema
sudo pacman -Syu --noconfirm

# 2. Instalar GNU Stow para la gestión de dotfiles
sudo pacman -S --needed --noconfirm stow git

# 3. Definir arrays de paquetes (separa CachyOS/Pacman de AUR/Paru)
PACMAN_PKGS=(
  alacritty ascii-image-converter bat bc bind blueman bluez bluez-utils btop
  btrfs-progs bun cava cbonsai chafa cliphist code curl deno direnv discord
  docker docker-compose dosfstools dunst efibootmgr eza fastfetch fcitx5
  fcitx5-configtool fcitx5-mozc fd feh firefox firefoxpwa flatpak foot fprintd
  gd ghostscript git github-cli gnome-keyring graphviz htop hypridle hyprlock
  hyprpicker hyprpm hyprshot hyprsunset imagemagick jq kitty lazydocker lazygit
  less matugen micro nano neovim network-manager-applet networkmanager nmap
  noto-fonts noto-fonts-cjk noto-fonts-emoji ntfs-3g nvtop nwg-look obsidian
  os-prober pacman-contrib papirus-folders papirus-icon-theme pavucontrol
  pipewire-alsa pipewire-jack pipewire-pulse polkit-kde-agent qt5-wayland
  qt6-wayland reflector ripgrep rofi-wayland rofimoji sddm starship steam swaync
  tailscale tesseract tesseract-data-eng tesseract-data-spa thunar tmux
  ttf-jetbrains-mono-nerd ttf-roboto unzip uwsm waybar wireguard-tools
  wireplumber wl-clipboard xdg-desktop-portal-gtk xdg-user-dirs
  xwayland-satellite ydotool yt-dlp zoxide zram-generator zsh
  zsh-autosuggestions zsh-syntax-highlighting cachyos-gaming
)

PARU_PKGS=(
  appimagelauncher aylurs-gtk-shell brave-bin darkly-bin dirb equibop-bin
  google-chrome kirigami2 libastal-4-git libastal-git libastal-io-git
  libastal-wireplumber-git libcava linux-wallpaperengine-git localsend
  peaclock pipes.sh qimgv qtengine sddm-theme-corners-git spotifast-bin
  tenki ttf-rubik-vf waypaper zen-browser-bin zscroll-git
)

# 4. Instalar repositorios oficiales
echo "Instalando paquetes de Pacman..."
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

# 5. Instalar paquetes de AUR (CachyOS incluye paru por defecto)
echo "Instalando paquetes de AUR..."
paru -S --needed --noconfirm "${PARU_PKGS[@]}"

# 6. Desplegar Dotfiles con Stow
# Se asume que tu repo está clonado en ~/dotfiles y la carpeta interior se llama "config"
echo "Desplegando dotfiles..."
cd ~/dotfiles
# Esto enlazará el contenido de ~/dotfiles/config hacia ~/.config
stow -t ~/.config config/

# 7. Habilitar servicios críticos
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now docker.service
sudo systemctl enable --now tailscaled.service
sudo systemctl enable --now sddm.service

echo "Instalación completada. Reinicia el sistema."
