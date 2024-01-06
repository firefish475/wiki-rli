Record audio with ardour
========================

The aim is to record audio without window focus with a fixed keyboard hotkey easily accessible. Even a midi-pedal could be great!

OSC is the official open and open source way to do this.

pacman -S liblo


To bind keys to oscsend:
https://wiki.archlinux.org/title/extra_keyboard_keys

pacman -S wev


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
