#!/usr/bin/env bash

if ! command -v playerctl &>/dev/null || ! command -v zscroll &>/dev/null; then
    echo '{"text": "Dependencias faltantes"}'
    exit 1
fi

exec zscroll \
    --length 20 \
    --delay 0.2 \
    --match-command "playerctl status 2>/dev/null" \
    --match-text "Playing" "--before-text '{\"text\": \" ' --after-text '\", \"class\": \"playing\"}'" \
    --match-text "Paused" "--before-text '{\"text\": \" ' --after-text '\", \"class\": \"paused\"}'" \
    --update-check true \
    "playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null"
