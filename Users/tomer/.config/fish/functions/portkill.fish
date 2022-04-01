function portkill
  lsof -P | grep ":$argv[1]" | awk '{print $2}' | xargs kill -9
end
