function short
  cd (dirname (redirects))
  command node lib/index.js $argv
  cdb
end

