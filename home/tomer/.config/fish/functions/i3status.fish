function i3status
  command i3status | while read -l line
    set -l name (workspace_name)
    echo " ws $name  | $line"
  end
end
