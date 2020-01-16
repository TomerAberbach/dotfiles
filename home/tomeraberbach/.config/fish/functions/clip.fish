function clip
  set -l input "$argv"

  if test -z $input
    read input
  end

  printf '%s\n' "$input" | xclip -selection clipboard 2>/dev/null
end

