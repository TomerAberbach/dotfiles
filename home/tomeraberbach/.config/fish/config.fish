# Ensure single instances of ssh- and gpg-agent
eval (keychain --agents ssh,gpg --quiet --eval)

# Configure NodeJS with mkcert (https://github.com/FiloSottile/mkcert)
set -x NODE_EXTRA_CA_CERTS (mkcert -CAROOT)/rootCA.pem

# Configure direnv (https://direnv.net)
direnv hook fish | source

