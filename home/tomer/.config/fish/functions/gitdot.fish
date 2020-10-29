function gitdot -w 'git'
  switch "$argv"
    case 'init'
      git init --bare $HOME/dotfiles.git
      and dotfiles config status.showUntrackedFiles no

    case 'clone *'
      if test (id -u) -ne 0
        echo 'dotfiles clone must be run as root'
      end

      set -l dotfiles_tmp (mktemp -d)

      git clone \
        --separate-git-dir=$HOME/dotfiles.git \
        $argv[2..-1] $dotfiles_tmp
      and rsync --recursive --verbose --exclude '.git' $dotfiles_tmp /

      rm -rf $dotfiles_tmp

    case 'tracked'
      dotfiles ls-tree --full-tree --name-only -r HEAD

    case '*'
      git --git-dir=$HOME/dotfiles.git --work-tree=/ $argv
  end
end
