function urlencode
  array $argv | while read -l arg
    python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]))" "$arg"
  end
end

