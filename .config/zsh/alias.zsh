# vim
alias v="nvim"

# unix command
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}
alias ls="ls -G"
alias grep="grep --color=always"
alias ..="cd .. && pwd"
alias ...="cd ../.. && pwd"
alias ....="cd ../../.. && pwd"

# git
alias cz="git add . && git cz"
alias cm="git commit -m"
alias save="git add . && git commit -m"
alias amend="git commit --amend"
alias co="git switch"
alias cob="git switch -c"
alias rename="git branch -m"
alias del="git branch -d"
alias cur="git rev-parse --abbrev-ref head | pbcopy"
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

# kubernetes
alias kube="kubectl"

