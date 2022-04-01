function fishify
  echo fish
  echo -- -c

  if test (count $argv) -gt 0; and test $argv[1] = '-q'
    echo -- "\"$argv[2..-1]\""
  else
    echo -- "$argv"
  end
end
