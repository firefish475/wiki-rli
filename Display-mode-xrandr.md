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

