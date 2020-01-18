function portkill
  fuser -k $argv[1]/tcp
end

