function gitdot -w 'git'
  set -l repository_path $HOME/.dotfiles.git

  switch "$argv"
    case 'init'
      git init --bare $repository_path
      and gitdot config status.showUntrackedFiles no

    case 'clone *'
      if test (id -u) -ne 0
        echo 'gitdot clone must be run as root'
        return 1
      end

      set -l dotfiles_tmp (mktemp -d)

      git clone \
        --separate-git-dir=$repository_path \
        $argv[2..-1] $dotfiles_tmp
      and rsync --recursive --verbose --exclude '.git' $dotfiles_tmp /

      rm -rf $dotfiles_tmp

    case 'tracked'
      gitdot ls-tree --full-tree --name-only -r HEAD

    case '*'
      git --git-dir=$repository_path --work-tree=/ $argv
  end
end

