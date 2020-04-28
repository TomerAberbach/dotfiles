function short
  cd (dirname (redirects))
  command node lib/tomer.link.js $argv
  cdb
end

