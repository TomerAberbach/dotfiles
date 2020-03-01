function urldecode
  array $argv | while read -l arg
    python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))" "$arg"
  end
end

