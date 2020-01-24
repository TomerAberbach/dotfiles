function array -d 'returns argv as array if nonempty, otherwise stdin as array'
  if test (count $argv) -eq 0
    while read -l arg
      unit $arg
    end
  else
    for arg in $argv
      unit $arg
    end
  end
end

