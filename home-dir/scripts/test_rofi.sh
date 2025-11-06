MENU=$(echo -e "About\nSign out\nSleep\nShutdown" | \
rofi -dmenu -p "" \
-location 1 -anchor northwest -xoffset 0 -yoffset 30 \
-theme-str '
window {
    width: 200;
    height: 120;
    background-color: #21ccff;
    border: 2px solid #ffb3cb;
}
mainbox {
    border: 0;
    padding: 0;
    children: [listview];
}
listview {
    scrollbar: false;
    border: 0;
    padding: 0;
    background-color: #21ccff;
}
element {
    padding: 4 8;
    background-color: #21ccff;
    color: black;
}
element:selected {
    background-color: #ffb3cb;
    color: white;
}
element:alternate {
    background-color: #ffb3cb;
    color: black;
}
element:urgent {
    background-color: #ff6666;
    color: white;
}
textbox-prompt-colon { enabled: false; }
entry { enabled: false; }
message { enabled: false; }
')

