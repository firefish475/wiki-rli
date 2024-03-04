User-sepcified XKB options preserved over system updates
========================================================

The most important links is this:

https://unix.stackexchange.com/questions/309580/does-wayland-use-xkb-for-keyboard-layouts

It contains links to Peter Hutterer's posts at https://who-t.blogspot.com/2020/08/user-specific-xkb-configuration-part-3.html

These infos are gold. Finally I can define my XKB options in $HOME.

I am using these options for ages now, at least since 2008 as I documented back in the days. My idea simply was that the US keyboard layout is the better choice for writing source codes compared to DE layout. The reason is that '{}[]\' are way easier to access. In the german layout I have to press and hold AltGr while pressing 7, 8 ,9 or 0 simultaneously. So I had the idea to use AltGr as the key to press and hold while typing ö, ä, ü and ß. Quite not so comfortable neither, but this would means I could use the US keyboard layout while being able to use simliar finger movements to type german umlauts. At work there was only the german keyboard layout in windows and mostly changing the layout was blocked. So I would have to use those finger movements for german umlauts at work at least. Using those at home, too, was a good idea I felt.

The options I implemented in xmodmap and the like and later I used XKB as it was more modern. For a very long time after every system update in /usr/share/X11/xkb/* I had to manually change back rules/{evdev,evdev.xml} and symbols/raoul. Obviousley since 2020 it is possible to put these in $XDG_CONFIG_DIR/xkb/ which is /home/USER/.config/xkb/ in most cases. All this works in Gnome on Archlinux using Wayland at least which is what I use atm.

I put that online now as I think some other ppl could profit from that. German ppl most likely that is. I keep xkb-raoul as it is the former file I pulled the manually performed changes back until recently. I keep it for historical reasons.

Eventually I will update the options and implement further ideas.


Installation
------------

Copy config_xkb to $XDG_CONFIG_DIR/xkb/

  cp -r config_xkb $XDG_CONFIG_DIR/xkb/

Alternativeley softlink it so that you get git pull and thus automatically update:

  ln -s path/to/config_xkb $XDG_CONFIG_DIR/xkb/


Tastatur-Option für Umlaute in XKB
==================================

Hier ist meine Lösung für die Verwendung von Umlauten auf der US-Tastatur. Diese ist grundsätzlich der deutschen Tastatur überlegen, da für u.a. die Programmierung und den Textsatz wichtige Klammern viel besser zu erreichen sind. Dagegen ist es natürlich sehr umständlich, Umlaute zu tippen.

Dieser Option liegt die Idee zugrunde, dass die Umlaute auf den Tasten liegen sollten, auf denen sie auch im deutschen Layout liegen. Um dem US-Layout nicht in die Quere zu kommen und weil es auch recht naheliegend für die Funktion Umlaute auf dem US-Layout zu tippen, habe ich den Modifier AltGr gewählt. Für Umlaute und scharfes S ist also die Taste AltGr und die entsprechende Taste wie auch auf dem deutschen Layout zu drücken. Das mache ich bei ä, ö und ü sowie ß einfach mit dem rechten Daumen. Für die großen Varianten dieser Buchstaben halte ich mit dem Kleinfinger der linken Hand noch die Shift-Taste.

Man wird dadurch kaum Probleme haben, wenn man mal nicht die US-Tastatur verwendet, sondern z.B. auf der Arbeit zur Verwendung der deutschen Tastatur gezwungen ist. Wären die Umlaute auf der US-Tastatur als Option irgendwie anders gelegt, dann hätte man bei jedem Wechsel Probleme mit der Umstellung. Die Verwendung von Compose unter X / Wayland wäre zudem wesentlich umständlicher zu tippen. Das Tippen bleibt mit meiner Option viel flüssiger.

Raoul
