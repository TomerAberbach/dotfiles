function sep
  set -l argc (count $argv)
  set -l index 1

  while test $index -le $argc
    set -l arg "$argv[$index]"

    if test $arg = '--'
      break
    end

    set index (math $index + 1)
  end

  set -l before (math $index - 1)
  echo "$argv[1..$before]"

  if test $before -eq $argc
    echo
  else
    set -l after (math $index + 1)
    echo "$argv[$after..$argc]"
  end
end
