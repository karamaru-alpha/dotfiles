# zsh
autoload -Uz compinit
compinit
eval "$(sheldon source)"

# vim
alias v="nvim"

# command
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}
alias ls="ls -G"
alias grep="grep --color=always"
alias ..="cd .. && pwd"
alias ...="cd ../.. && pwd"
alias ....="cd ../../.. && pwd"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# git
alias cz="git add . && git cz"
alias cm="git commit -m"
alias save="git add . && git commit -m"
alias amend="git commit --amend"
alias co="git switch"
alias cob="git switch -c"
alias rename="git branch -m"
alias del="git branch -D"
alias cur="git rev-parse --abbrev-ref HEAD | pbcopy"
fco() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git switch $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
alias mg="git merge"
alias pullf='(){git fetch origin $1 && git reset --hard origin/$1}'
alias refresh='git restore --staged . && git checkout . && git clean -df'
alias root="cd $(git rev-parse --show-toplevel)"

# z
. `brew --prefix`/etc/profile.d/z.sh

# kubernetes
alias kube="kubectl"
source <(kubectl completion zsh)

# gcp
export PATH=$PATH:$HOME/google-cloud-sdk/bin
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# docker
source ~/.docker/init-zsh.sh || true

# mise
eval "$(~/.local/bin/mise activate zsh)"
