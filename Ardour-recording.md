Record audio with ardour
========================

The Ardour ThinkVantage Recording Button
----------------------------------------

pacman -S ardour liblo

Ardour-rec.sh:

#!/bin/bash
#
/usr/bin/play /usr/share/sounds/gnome/default/alerts/click.ogg &
oscsend osc.udp://localhost:3819 /rec_enable_toggle
oscsend osc.udp://localhost:3819 /toggle_roll

gnome-control-center -> Keyboard -> Keyboard Shortcuts -> View and Customize Shortcuts -> Custom Shortcuts -> Add Shortcut or '+' -> OSCsend Ardour rec -> Ardour-rec.sh -> press ThinkVantage or other shortcut key

Start ardour
Window -> Big Clock (turns red while recording)

This does not work (why?, how to configure ThinkVantage via gsettings?) :

gsettings set  org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'OSCsend Ardour record'
gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'oscsend osc.udp://localhost:3819 /toggle_roll/rec_enable_toggle' 
gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "['Launch1']"


The way to discover this
------------------------

The aim is to record audio without window focus with a fixed keyboard hotkey easily accessible. Even a midi-pedal could be great!

OSC is the official open and open source way to do this.

pacman -S liblo

ThinkVantage key can be bound in graphical settings in Gnome.

Then list all Gnome keybindings:
for k in `gsettings list-keys org.gnome.desktop.wm.keybindings`; do echo $k = `gsettings get org.gnome.desktop.wm.keybindings $k`; done

gsettings list-recursively  org.gnome.desktop.wm.keybindings | sort | more


gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['Launch1']"

This works, test by resetting volume-down and volume-up and binding it to Launch1. So the ThinkVantage key is Launch1 in Archlinux Gnome3.

gsettings list-keys org.gnome.settings-daemon.plugins.media-keys

To bind keys to oscsend:
https://wiki.archlinux.org/title/extra_keyboard_keys

pacman -S wev


https://www.suse.com/de-de/support/kb/doc/?id=000019319
gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings


Using tools to snoop on keyboard:
evtest /dev/input/...
wev

[14:     wl_keyboard] key: serial: 40384; time: 11917082; key: 156; state: 1 (pressed)
                      sym: XF86Launch1  (269025089), utf8: ''
[14:     wl_keyboard] key: serial: 40385; time: 11917083; key: 156; state: 0 (released)
                      sym: XF86Launch1  (269025089), utf8: ''
[14:     wl_keyboard] key: serial: 40386; time: 11917592; key: 156; state: 1 (pressed)
                      sym: XF86Launch1  (269025089), utf8: ''
[14:     wl_keyboard] key: serial: 40387; time: 11917592; key: 156; state: 0 (released)
                      sym: XF86Launch1  (269025089), utf8: ''
[14:     wl_keyboard] key: serial: 40388; time: 11918039; key: 156; state: 1 (pressed)
                      sym: XF86Launch1  (269025089), utf8: ''
[14:     wl_keyboard] key: serial: 40389; time: 11918039; key: 156; state: 0 (released)
                      sym: XF86Launch1  (269025089), utf8: ''



< x42> SparFuxXx: if Ardour has no focus, you have to "remote control" it. Various options exist for that.
17:46 < x42> SparFuxXx: you could use OSC (enable it in Ardour Preferences > Control Surfaces.  then bind some 
             keyboard shortcut to  `oscsend osc.udp://localhost:3819 /transport_play`
17:48 < x42> SparFuxXx: on Linux with X11, you could do some tricks and send key-events to non-focused windows, 
             something like     xdotool search --name "Ardour" key space
17:48 < x42> but OSC is likely preferable. 
             https://manual.ardour.org/using-control-surfaces/controlling-ardour-with-osc/osc-control/
17:49 < x42> you may want     oscsend osc.udp://localhost:3819 /toggle_roll
17:50 < x42> (oscsend is packaged as part of liblo-tools on most GNU/Linux distros)
17:50 -!- MarvoloRiddle [~TheGuest@82.84.147.208] has quit [Remote host closed the connection]
17:50 -!- TheGuest [~TheGuest@82.84.147.208] has joined #ardour
17:51 < SparFuxXx> x42: Thanks for the hint. I will investigate on this.
17:51 < x42> SparFuxXx: you're welcome

cat /proc/bus/input/devices


The following commands must be run as the user.

Command to create the 'custom0' key binding:

gsettings set  org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

Command to enter the name of the binding:

gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'File Browser'

Command to enter the command to run:

gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'nautilus'

Command to enter the key combination that will run the command:

gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>s'

  553  vim Ardour-recording.md 
  554  gsettings set  org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
  555  gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'OSCsend record'
  556  vim Ardour-recording.md 
  557  gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'nautilus'
  558  gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "['Launch1']"


https://docs.fedoraproject.org/en-US/quick-docs/gnome-setting-key-shortcut/


gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Teststart nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "['Launch1']"

  562  history 10 >> Ardour-recording.md 
gsettings set  org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'OSCsend Ardour record'
gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'oscsend osc.udp://localhost:3819 /toggle_roll/rec_enable_toggle' 
gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "['Launch1']"
gsettings set  org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'bash -c ~/Ardour-rec.sh' 


oscsend osc.udp://localhost:3819 /toggle_roll/rec_enable_toggle


<@las> SparFuxXx: my point was that if you make the Ardour "Big Clock" window visible, it can also function 
             as the "recording is active" indicator, although it is certainly larger than "a red dot"


gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom11/']"
