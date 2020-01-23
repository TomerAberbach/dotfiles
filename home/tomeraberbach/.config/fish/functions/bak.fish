function bak
  for arg in (array $argv)
    if not test -e $arg
      print "Skipping $arg, not a file or directory"
      continue
    end

    if string match -q '*.bak' -- $arg
      print "Skipping $arg, a backup itself"
      continue
    end

    if test \( -f $arg -a -f $arg.bak \) -o \( -d $arg -a -d $arg.bak \)
      print "Skipping $arg, already backed up"
      continue
    end

    command cp -r $arg $arg.bak
  end
end

