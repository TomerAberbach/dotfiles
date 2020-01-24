function filter
  while read -l arg
    if eval (un@ $arg $argv)
      unit $arg
    end
  end
end

