function mkcd -w 'mkdir'
  mkdir $argv
  and cd $argv[(count $argv)]
end

