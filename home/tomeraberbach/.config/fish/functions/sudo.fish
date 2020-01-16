function sudo -w 'sudo'
  if functions -q $argv[1]; or contains $argv[1] (builtin -n)
    set argv fish -c "$argv"
  end
  command sudo -E $argv
end

