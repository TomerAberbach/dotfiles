function scrot -w 'scrot'
  if test (count $argv) -eq 0; or not test -d $argv[-1]
    command scrot $argv
    notify-send 'screenshot has been saved'
    return
  end

  set -l dirname "$argv[-1]"
  set -e argv[-1]

  if not cd $dirname
    return 1
  end

  command scrot $argv
  cd -
  notify-send 'screenshot has been saved'
end
