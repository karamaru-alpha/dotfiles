# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="wedisagree"
source $ZSH/oh-my-zsh.sh

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# git
## commit
alias cz="git add .; git cz"
alias cm="git commit --signoff -m"
alias save="git add . && git commit --signoff -m"
alias amend="git commit --amend"
## branch
alias co="git switch"
alias cob="git checkout -b"
alias rename="git branch -m"
alias del="git branch -D"
alias cur="git rev-parse --abbrev-ref HEAD | pbcopy"
alias pc='git branch | peco | xargs git switch'
## merge
alias mg="git merge"
alias pullf='(){git fetch origin $1 && git reset --hard origin/$1}'
alias refresh='git restore --staged . && git checkout . && git clean -df'

# z
. `brew --prefix`/etc/profile.d/z.sh

# kubernetes
alias kube="kubectl"

# gcp
export PATH=$PATH:$HOME/google-cloud-sdk/bin
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi
source <(kubectl completion zsh)
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# docker
source ~/.docker/init-zsh.sh || true

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
