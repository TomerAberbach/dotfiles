function weather
  set -l arg (string escape --style=url -- $argv)
  curl "https://wttr.in/$arg"
end

