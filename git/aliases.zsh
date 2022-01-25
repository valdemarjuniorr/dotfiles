#!/bin/sh
if which hub >/dev/null 2>&1; then
	alias git='hub'
fi

alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glg --all"
alias gp='git push origin HEAD'
alias gm='git push origin master'
alias gpa='git push origin --all'
alias gd='git diff'
alias gc='git commit'
alias gca='gc -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch -v'
alias ga='git add'
alias gaa='git add -A'
alias gcm='gc -m'
alias gcam='git commit -a -m'
alias gst='git status -sb'
alias gbd='git branch -D'
alias gpom='git pull origin main'
alias gpr='gp && git pr'
alias glnext='git log --oneline $(git describe --tags --abbrev=0 @^)..@'
alias grebase='git pull origin main && git push origin'

if which svu >/dev/null 2>&1; then
	alias gtpatch='echo `svu p`; git tag `svu p`'
	alias gtminor='echo `svu m`; git tag `svu m`'
fi

gi() {
	curl -s "https://www.gitignore.io/api/$*"
}
