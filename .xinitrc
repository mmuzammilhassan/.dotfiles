#!/bin/sh

# 1. ARCH SYSTEM BASICS
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# 2. KEYBOARD FOUNDATION
# Reset to standard US Dvorak first.
# This prevents errors if you reload xmodmap multiple times.
setxkbmap -layout us -variant dvorak &

# Wait a split second for setxkbmap to apply, then apply your Layers
(sleep 1 && xmodmap "$HOME/.Xmodmap") &

# 3. INPUT TWEAKS
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 &

# 4. VISUALS
# Run your theme script (defaults to dark on boot)
picom --config ~/.config/picom/picom.conf &
~/.local/bin/rosepine dark & 
dwmblocks &
alttab -w 1 &

# 5. START DWM
exec dwm
