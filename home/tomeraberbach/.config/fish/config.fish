# Ensure single instances of ssh- and gpg-agent
eval (keychain --agents ssh,gpg --quiet --eval)

# Configure NodeJS with mkcert (https://github.com/FiloSottile/mkcert)
set -x NODE_EXTRA_CA_CERTS (mkcert -CAROOT)/rootCA.pem

# Configure direnv (https://direnv.net)
direnv hook fish | source


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
