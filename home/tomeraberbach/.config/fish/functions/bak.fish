function bak
  array $argv | while read -l arg
    if not test -e $arg
      unit "Skipping $arg, not a file or directory"
      continue
    end

    if string match -q '*.bak' -- $arg
      unit "Skipping $arg, a backup itself"
      continue
    end

    if test \( -f $arg -a -f $arg.bak \) -o \( -d $arg -a -d $arg.bak \)
      unit "Skipping $arg, already backed up"
      continue
    end

    command cp -r $arg $arg.bak
  end
end

