MENU=$(echo -e "About\nSign out\nSleep\nShutdown" | \
rofi -dmenu -p "" -theme ~/.config/rofi/pinkblue.rasi)

case "$MENU" in
    "About")
        MOTD=1 kitty --hold bash -c "hyfetch"
        ;;
    "Sign out")
        hyprctl dispatch exit
        ;;
    "Sleep")
        systemctl suspend
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
esac



