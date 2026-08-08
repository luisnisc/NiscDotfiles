#!/usr/bin/env bash

# Ejecuta playerctl en modo escucha continua (--follow)
playerctl --follow metadata --format "{{status}}|||{{artist}} - {{title}}" 2>/dev/null | while read -r line; do

    # Separamos el estado (Playing/Paused) de la información de la canción
    STATUS="${line%%|||*}"
    INFO="${line#*|||}"

    # Escapamos las comillas dobles para que no rompan el formato JSON de Waybar
    INFO="${INFO//\"/\\\"}"

    echo "{\"text\": \" $INFO\", \"class\": \"playing\"}"
done
