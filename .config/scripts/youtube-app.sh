#!/usr/bin/env bash
brave --app="https://youtube.com" \
         --user-data-dir="$HOME/.local/share/chromium-apps/youtube" \
         --class="youtube-webapp" \
         --disable-extensions \
         --disable-background-networking
