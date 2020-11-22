#!/usr/bin/env fish

set -l sysresources /etc/X11/xinit/.Xresources
test -f $sysresources; and xrdb -merge $sysresources

set -l sysmodmap /etc/X11/xinit/.Xmodmap
test -f $sysmodmap; and xmodmap $sysmodmap

set -l userresources $HOME/.Xresources
test -f "$userresources"; and xrdb -merge "$userresources"

set -l usermodmap $HOME/.Xmodmap
test -f "$usermodmap"; and xrdb -merge "$usermodmap"

if test -d /etc/X11/xinit/xinitrc.d
  for file in /etc/X11/xinit/xinitrc.d/?*.sh
    test -x "$file"; and "$file"
  done
done

exec i3
