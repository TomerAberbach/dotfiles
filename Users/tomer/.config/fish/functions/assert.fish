function assert
  set -l components (sep $argv)

  if test (string split ' ' -- $components[1])
    return
  end
  
  set -l message "$components[2]"
  if test -z $message
    echo -- "assertion failed: $argv"
  else
    echo -- $message
  end 

  return 1
end
