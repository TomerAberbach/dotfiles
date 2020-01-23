function array -d 'returns argv as array if nonempty, otherwise stdin as array'
  if test (count $argv) -eq 0
    while read -l arg
      print $arg
    end
  else
    print $argv
  end
end

