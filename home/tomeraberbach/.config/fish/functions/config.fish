function config -w 'git'
  set -l dir $HOME/.config.git
  set -l opts (string split ' ' (getopts $argv))

  if test (count $opts) -eq 2 -a $opts[1] = '_'
    switch $opts[2]
      case init
        git init $dir --bare
        config config --local status.showUntrackedFiles no
        config commit --allow-empty -m 'Initial commit'
        return
      case unstaged        
        config ls-files -omd (ff)
        return
      case tracked
        config ls-tree --full-tree --name-only -r HEAD
        return
    end
  end

  git --git-dir=$dir --work-tree=/ $argv
end

