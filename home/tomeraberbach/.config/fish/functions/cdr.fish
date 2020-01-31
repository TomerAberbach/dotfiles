function cdr
  set -l root (git rev-parse --show-toplevel)
  and cd $root
end

