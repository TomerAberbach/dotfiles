function watch -w 'watch'
  set -l new_argv

  for arg in $argv
    set -a new_argv (unit (fishify $arg))
  end

  command watch $new_argv
end

