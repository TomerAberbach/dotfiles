#!/usr/bin/env python3

from os.path import expanduser
import xrp

names = {
  'selectionForeground': 'selection_foreground',
  'selectionBackground': 'selection_background',
  'cursorText': 'cursor_text_color',
  'url': 'url_color'
}

colors = xrp.parse_file(expanduser('~/.Xresources.d/colors'), encoding='utf8')

with open(expanduser('~/.config/kitty/colors.conf'), 'w') as file:
  for resource, value in colors.resources.items():
    suffix = resource.split('.')[-1]
    conf_name = names.get(suffix, suffix)
  
    file.write(f'{conf_name} {value}\n')
