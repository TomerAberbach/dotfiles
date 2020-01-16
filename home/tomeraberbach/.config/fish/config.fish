# Ensure single instances of ssh- and gpg-agent
eval (keychain --agents ssh,gpg --quiet --eval)

# Configure Starship Prompt (https://starship.rs)
starship init fish | source

