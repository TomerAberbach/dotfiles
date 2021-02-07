# Dotfiles

> The files that configure my computer!

## If these are your dotfiles, then why is `/etc` in here?!?!

I wanted to able to track configuration files outside my home directory so I created a bare git repository at `~/.dotfiles.git` and wrote a [git wrapper](https://github.com/TomerAberbach/dotfiles/blob/main/home/tomer/.config/fish/functions/gitdot.fish) that prefixes git commands with `--git-dir=$HOME/.dotfiles.git --work-tree=/`!         

## So your whole computer is a git repository? ... Does that mean this `readme.md` is directly under your root directory...?

Yeahhhh...

## License

[MIT](https://github.com/TomerAberbach/dotfiles/blob/main/license) © [Tomer Aberbach](https://github.com/TomerAberbach)
