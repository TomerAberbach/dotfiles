#!/usr/bin/env fish

xrdb -merge $HOME/.Xresources
python $HOME/.Xresources.d/color_to_kitty.py
xsettingsd &

exec i3
