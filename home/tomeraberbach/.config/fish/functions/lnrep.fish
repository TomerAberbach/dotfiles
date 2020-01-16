function lnrep
  for arg in $argv
    if test ! -L $arg
      echo "Skipping $arg, not a symbolic link"
      continue
    end

    set -l original (readlink $arg)

    if test -d $arg
      rimraf $arg
    end

    mv $original $arg
  end
end

