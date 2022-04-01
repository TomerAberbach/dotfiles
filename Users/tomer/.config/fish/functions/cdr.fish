function cdr
  set -l git_dir (findup '.git')

  if test -z $git_dir
    return 1
  end

  cd (dirname $git_dir)
end
