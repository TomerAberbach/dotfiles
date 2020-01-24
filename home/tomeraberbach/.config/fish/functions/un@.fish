function un@
  set -l length (count $argv)
  set -l index 2

  while test $index -le $length
    if test $argv[$index] = '@'
      unit $argv[1]
    else
      unit $argv[$index]
    end

    set index (math $index + 1)
  end
end

