# zsh
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz compinit
compinit

### zinit plugins
zinit wait lucid blockf light-mode for \
    @'zsh-users/zsh-syntax-highlighting' \
    @'zsh-users/zsh-autosuggestions' \
    @'zsh-users/zsh-completions' \
    @'paulirish/git-open'

PROMPT='%F{white}%* '$PROMPT
eval "$(starship init zsh)"

# vim
alias v="nvim"

# linux command
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}
alias ls="ls -G"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# git
## commit
alias cz="git add .; git cz"
alias cm="git commit -m"
alias save="git add . && git commit -m"
alias amend="git commit --amend"
## branch
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
## merge
alias mg="git merge"
alias pullf='(){git fetch origin $1 && git reset --hard origin/$1}'
alias refresh='git restore --staged . && git checkout . && git clean -df'

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

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
