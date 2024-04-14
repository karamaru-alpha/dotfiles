# z
. `brew --prefix`/etc/profile.d/z.sh

# kubernetes
source <(kubectl completion zsh)

# gcp
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

# docker
source ~/.docker/init-zsh.sh || true

# mise
eval "$(~/.local/bin/mise activate zsh)"
