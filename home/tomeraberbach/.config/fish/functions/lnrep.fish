function lnrep
  for arg in $argv
    if not test -L $arg
      unit "Skipping $arg, not a symbolic link"
      continue
    end

    set -l original (readlink $arg)

    if test -d $arg
      rimraf $arg
    end

    command mv $original $arg
  end
end

