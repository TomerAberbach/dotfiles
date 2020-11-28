function findup
  set -l current (pwd)

  while not test -e "$current/$argv"
    set current (dirname $current)

    if test $current = '/'
      return
    end
  end

  echo -- "$current/$argv"
end
