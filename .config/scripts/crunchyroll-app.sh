#!/usr/bin/env bash
brave --app="https://crunchyroll.com" \
         --user-data-dir="$HOME/.local/share/chromium-apps/crunchyroll" \
         --class="crunchyroll-webapp" \
         --disable-extensions \
         --disable-background-networking
