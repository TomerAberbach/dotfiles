function sudo -w 'sudo'
  if string match -qr '^-' -- "$argv[1]"
    command sudo $argv
  else
    command sudo -E (fishify $argv)
  end
end
