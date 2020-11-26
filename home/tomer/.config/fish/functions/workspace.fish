function workspace
  # Print out the current workspace
  if test (count $argv) -eq 0
    i3-msg -t get_workspaces \
      | jq '.[] | select(.focused==true).name' \
      | cut -d"\"" -f2
    return
  end

  set -l next "$argv[1]"
  set -l number (workspace_number)

  if test (string length $number) -eq 1
    set number "0$number"
  end

  set -l x (string sub -l 1 $number)
  set -l y (string sub -s 2 -l 1 $number)

  switch $next
    case up
      set y (math "$y + 1")
    case right
      set x (math "$x + 1")
    case down
      set y (math "$y - 1")
    case left
      set x (math "$x - 1")
  end

  set x (clamp 0 $x 1)
  set y (clamp 0 $y 1)

  set number (math "abs($x$y)")
  set -l name
  switch $number
    case 11
      set name '◳'
    case 1
      set name '◰'
    case 0
      set name '◱'
    case 10
      set name '◲'
  end

  i3-msg workspace "$number:$name" >/dev/null
  killall -USR1 i3status
end
