function workspace_number
  set -l components (string split ':' (workspace))
  echo "$components[1]"
end
