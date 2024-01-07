Record audio with ardour
========================

The aim is to record audio without window focus with a fixed keyboard hotkey easily accessible. Even a midi-pedal could be great!

OSC is the official open and open source way to do this.

pacman -S liblo



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

