function workspace_name
  set -l components (string split ':' (workspace))
  echo "$components[2]"
end
