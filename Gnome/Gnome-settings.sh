#!/bin/bash

gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 25
gsettings set org.gnome.desktop.peripherals.keyboard delay 200
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
gsettings set org.gnome.desktop.wm.preferences raise-on-click false

gsettings set org.gnome.desktop.input-sources sources "[('xkb','us'), ('xkb', 'de')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['raoul:altgr-syms']"

gsettings set org.gnome.shell.keybindings switch-to-application-1 []
gsettings set org.gnome.shell.keybindings switch-to-application-2 []
gsettings set org.gnome.shell.keybindings switch-to-application-3 []
gsettings set org.gnome.shell.keybindings switch-to-application-4 []
gsettings set org.gnome.shell.keybindings switch-to-application-5 []

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Super>5']"


gsettings set org.gnome.desktop.wm.preferences raise-on-click true




#LU_DICTCC=bash -c "firefox \"http://dict.cc/?s=`xclip -o`\""
#bash -c "firefox \"http://en.wiktionary.org/wiki/`xclip -o`\""
#bash -c "firefox \"http://en.wikipedia.org/wiki/`xclip -o`\""
#bash -c "firefox \"http://de.wikipedia.org/wiki/`xclip -o`\""
#bash -c "firefox \"http://www.google.de/search?q=`xclip -o`\""
#bash -c "qrencode -o - -s 15 \"`xclip -o`\" | display -"

