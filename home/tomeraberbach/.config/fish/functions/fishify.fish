function fishify
  if fishy $argv[1]
    set argv fish -c "$argv"
  else if test $argv[1] = '-q'; and fishy $argv[2]
    set -e argv[1]
    set argv fish -c "\"$argv\""
  end

  array $argv
end

