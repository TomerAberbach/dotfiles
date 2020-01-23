function watch -w 'watch'
  set -l new_argv

  for arg in $argv
    set -l fishified (fishify $arg)
    set -a new_argv "$fishified"
  end

  command watch $new_argv
end

