# Ensure single instances of ssh- and gpg-agent
eval (keychain --agents ssh,gpg --quiet --eval)

# Configure direnv (https://direnv.net)
direnv hook fish | source

# Configure Starship Prompt (https://starship.rs)
starship init fish | source

