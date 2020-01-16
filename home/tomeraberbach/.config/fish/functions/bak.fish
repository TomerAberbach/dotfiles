function bak
  for arg in $argv
    if test ! -e $arg
      echo "Skipping $arg, not a file or directory"
      continue
    end

    if string match -q '*.bak' -- $arg
      echo "Skipping $arg, a backup itself"
      continue
    end

    if test \( -f $arg -a -f $arg.bak \) -o \( -d $arg -a -d $arg.bak \)
      echo "Skipping $arg, already backed up"
      continue
    end

    command cp -r $arg $arg.bak
  end
end

