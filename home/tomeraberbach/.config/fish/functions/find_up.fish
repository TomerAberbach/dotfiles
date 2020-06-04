function find-up
  set -l current (pwd)

  while not test -e "$current/$argv"
    set current (dirname $current)

    if test $current = '/'
      return
    end
  end

  unit "$current/$argv"
end

