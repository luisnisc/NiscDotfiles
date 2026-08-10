#!/bin/bash

# 1. Dar tiempo a que Hyprland e IPC inicialicen completamente tras el login
sleep 2

# 2. Forzar el foco al Workspace 3 para construir el layout
hyprctl dispatch workspace 3

# 3. Columna Izquierda: NvTop (Abre y espera a que se mapee)
kitty --class dash-nvtop -e nvtop &
sleep 0.6

# 4. Columna Derecha: Btop (Divide la pantalla por defecto 50/50)
kitty --class dash-btop -e btop &
sleep 0.6

# 5. Ajustar la asimetría: Reducimos el tamaño de Btop hacia la izquierda
# para replicar tu captura (~25% izquierda, ~75% derecha)
hyprctl dispatch splitratio -0.2

# 6. Dividir la columna izquierda: Cava
# Forzamos el foco de vuelta a NvTop y abrimos Cava para que parta ese lado
hyprctl dispatch focuswindow class:dash-nvtop
kitty --class dash-cava -e cava &
sleep 0.6

# 7. Dividir la columna derecha: Lazydotfiles
# Forzamos el foco a Btop y lanzamos la configuración de git bare
hyprctl dispatch focuswindow class:dash-btop
kitty --class dash-lazy -e lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME &
sleep 0.6


hyprctl dispatch focuswindow class:dash-pipes.sh
kitty --class dash-pipes -e pipes.sh &
sleep 0.6

# 8. (Opcional) Devolver al usuario al Workspace 1 al terminar la construcción
hyprctl dispatch workspace 1
