function cdr
  set -l git_dir (find_up '.git')

  if test -z $git_dir
    return 1
  end

  cd (dirname $git_dir)
end

