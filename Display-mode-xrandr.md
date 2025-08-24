# Xrandr add mode line

$ cvt

usage: cvt [-v|--verbose] [-r|--reduced] X Y [refresh]

 -v|--verbose : Warn about CVT standard adherence.
 -r|--reduced : Create a mode with reduced blanking (default: normal blanking).
            X : Desired horizontal resolution (multiple of 8, required).
            Y : Desired vertical resolution (required).
      refresh : Desired refresh rate (default: 60.0Hz).

Calculates VESA CVT (Coordinated Video Timing) modelines for use with X.


e.g. cvt 2560 1440 59.9

xrandr --newmode "newmode" <modeline>
xrandr --addmode DP-2 "newmode"

  489  ls /sys/class/drm/card1
  490  ls /sys/class/drm/card*
  491  cat /sys/class/drm/card1-DP-2/modes
  492  cat /sys/class/drm/card1-DP-2/edid | parse-edid
  493  cat /sys/class/drm/card1-DP-2/modes
  494  cat /sys/class/drm/card1/card1-LVDS-1/
  495  cat /sys/class/drm/card1/card1-LVDS-1/modes 
  496  cat /sys/class/drm/card1/card1-DP-1/modes 
  497  cat /sys/class/drm/card1/card1-DP-2/modes 


  533  cvt 2560 1440 60
  534  xrandr --newmode "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
  535  xrandr --admode DP-2 "2560x1440_60.00"
  536  xrandr --addmode DP-2 "2560x1440_60.00"

xrandr --output DP-2 --mode "..."


  500  xrandr
  501  cvt 1920 1080 60
  502  xrandr --newmode "my1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
  503  xrandr --addmode DP-2 "my1920x1080_60.00" 
  504  xrandr --output DP-2 --mode "my1920x1080_60.00" 
  505  xrandr

###
~/.config/monitors.xml



https://wiki.archlinux.org/title/Xrandr

Screen resolution reverts back after a blink

If you use GNOME and your monitor does not have an EDID, above #Adding undetected resolutions might not work, with your screen just blinking once, after xrandr --output.

Poke around with ~/.config/monitors.xml, or delete the file completely, and then reboot.

It is better explained in this article. 

https://unix.stackexchange.com/questions/184941/gnome-prevents-high-resolution-vga-without-edid-info-over-vga


https://gitlab.gnome.org/GNOME/mutter/-/blob/main/doc/monitor-configuration.md


# funktioniert nicht:
https://github.com/pop-os/cosmic-randr
https://git.sr.ht/~emersion/wlr-randr


# anstatt reboot:
udevadm control --reload-rules && udevadm trigger


udevadm info --attribute-walk -n <device_path>



### Question

I am using Archlinux with Gnome wayland on a Thinkpad X200 with libreboot. On startup the secondary display gets configured when the Thinkpad is docked to UltraBase (DisplayPort cable). But the config seems kind of random, on the secondary display 1280x720 works everytime, but 1920x1080 works only occasionally. Are there multiple mechanisms at work interfering with each other?
