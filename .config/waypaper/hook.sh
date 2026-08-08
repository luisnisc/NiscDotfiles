#!/usr/bin/env bash

export PATH="$HOME/.local/bin:$HOME/go/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

LOG_FILE="$HOME/.config/waypaper/hook.log"
exec > "$LOG_FILE" 2>&1

WALLPAPER="$1"
echo "[$(date)] Procesando fondo: $WALLPAPER"

TEMP_PNG="/tmp/current_wallpaper.png"
SDDM_DIR="/usr/share/sddm/themes/corners"

if [ -f "$WALLPAPER" ]; then
    magick "$WALLPAPER" "$TEMP_PNG"
    cp "$TEMP_PNG" "$SDDM_DIR/background.png"
    echo "[$(date)] Fondo procesado y sincronizado con SDDM."
else
    echo "[$(date)] Error: El archivo $WALLPAPER no existe."
    exit 1
fi

LUMINANCE=$(magick "$TEMP_PNG" -colorspace gray -format "%[fx:median]" info:)

if (( $(echo "$LUMINANCE > 0.6" | bc -l) )); then
    echo "[$(date)] Detectado fondo CLARO (Mediana: $LUMINANCE)"
    MODE="light"
    GTK_DARK_PREF=0
    SCHEME="prefer-light"
else
    echo "[$(date)] Detectado fondo OSCURO (Mediana: $LUMINANCE)"
    MODE="dark"
    GTK_DARK_PREF=1
    SCHEME="prefer-dark"
fi

echo "[$(date)] Generando paleta con Matugen (Modo: $MODE)..."

if ! matugen image "$TEMP_PNG" -m "$MODE" -t scheme-fidelity; then
    echo "[$(date)] ADVERTENCIA: Matugen rechazó la imagen. Calculando color de contingencia..."

    FALLBACK_HEX=$(magick "$TEMP_PNG" -colors 16 -format "%c" histogram:info: | sort -nr | grep -v -E -i '#(000000|0[0-9a-f]{5}|1[0-9a-f]{5}|2[0-9a-f]{5})' | head -n 1 | grep -oE '#[0-9A-Fa-f]{6}')

    if [ -z "$FALLBACK_HEX" ]; then
        FALLBACK_HEX="#ba1a1a"
        echo "[$(date)] Imagen sin color detectado. Usando color de emergencia: $FALLBACK_HEX"
    else
        echo "[$(date)] Inyectando color representativo extraído: $FALLBACK_HEX"
    fi

    matugen color hex "$FALLBACK_HEX" -m "$MODE" -t scheme-fidelity
fi

gsettings set org.gnome.desktop.interface color-scheme "$SCHEME"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"

if [ ! -f ~/.config/gtk-3.0/settings.ini ]; then
    mkdir -p ~/.config/gtk-3.0
    echo -e "[Settings]\ngtk-theme-name = Adwaita\ngtk-application-prefer-dark-theme = 0" > ~/.config/gtk-3.0/settings.ini
fi

sed -i "s/gtk-theme-name.*/gtk-theme-name = Adwaita/" ~/.config/gtk-3.0/settings.ini
sed -i "s/gtk-application-prefer-dark-theme.*/gtk-application-prefer-dark-theme = $GTK_DARK_PREF/" ~/.config/gtk-3.0/settings.ini

pkill -USR1 -x kitty
pkill -SIGUSR2 waybar
hyprctl reload

killall waypaper

echo "[$(date)] Sincronización completada con éxito."
