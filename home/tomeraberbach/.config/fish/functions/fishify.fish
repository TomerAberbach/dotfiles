function fishify
  if fishy $argv[1]
    set argv fish -c "$argv"
  end

  print $argv
end

