function map
  while read -l arg
    eval (un@ $arg $argv)
  end
end

