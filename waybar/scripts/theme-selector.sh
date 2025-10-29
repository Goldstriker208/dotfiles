#!/bin/bash

THEME=$(echo -e "Dark\nLight\nKvantum\nBreeze" | rofi -dmenu -p "Select Theme")

case "$THEME" in
  Dark)
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    ;;
  Light)
    gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
    ;;
  Kvantum)
    kwriteconfig6 --file kdeglobals --group KDE --key widgetStyle kvantum
    ;;
  Breeze)
    kwriteconfig6 --file kdeglobals --group KDE --key widgetStyle Breeze
    ;;
esac
