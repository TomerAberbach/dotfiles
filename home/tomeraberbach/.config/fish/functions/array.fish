function array -d 'returns argv as array if nonempty, otherwise stdin as array'
  if test (count $argv) -eq 0
    while read -l arg
      echo $arg
    end
  else
    for arg in $argv
      echo $arg
    end
  end
end

