function ext
  for arg in $argv
    switch $arg
      case '*.tar.bz2'
        command tar xjf $arg
      case '*.tar.gz'
        command tar xzf $arg
      case '*.bz2'
        command bunzip2 $arg
      case '*.gz'
        command gunzip $arg
      case '*.tar'
        command tar xf $arg
      case '*.tbz2'
        command tar xjf $arg
      case '*.tgz'
        command tar xzf $arg
      case '*.zip'
        command unzip $arg
      case '*.Z'
        command uncompress $arg
      case '*.7z'
        command 7z x $arg
      case '*'
        echo "Skipping $arg, not a known compressed format"
    end
  end
end

