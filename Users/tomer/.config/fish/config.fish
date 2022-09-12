set -g fish_color_command brwhite
set -g fish_color_comment cyan
set -g fish_color_error red
set -g fish_color_operator blue
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection magenta

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin

set -gx PNPM_HOME "/Users/tomer/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
set -gx EDITOR micro
