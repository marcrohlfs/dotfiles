# Overwrite functions and aliases of the default 'git' plugin

# Load the default 'git' plugin
if [ -f ${ZSH}/plugins/git/git.plugin.zsh ]; then
  source ${ZSH}/plugins/git/git.plugin.zsh
else
  builtin echo "[oh-my-zsh] default plugin 'git' not found"
fi

# Aliases
alias gad='git add'
alias gada='git add --all'
alias gbr='git branch'
alias gbrd='git branch --delete'
alias gbrD='git branch --delete --force'
alias gbrm='git branch --move'
alias gbrr='git branch --remotes'
alias gbrsu='git branch --set-upstream-to'
alias gbruu='git branch --unset-upstream'
alias gbrvv='git branch -vv'
alias gbrvva='git branch -vva'
alias gcf='git config'
alias gcfa='git config --add'
alias gcfl='git config --list'
alias gci='git commit'
alias gcia='git commit --amend'
alias gcl='git clone'
alias gcn='git clean'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcpnc='git cherry-pick --no-commit'
alias gcps='git cherry-pick --skip'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gdfns='git diff --name-status'
alias gft='git fetch --no-tags'
alias gfta='git fetch --all --no-tags'
alias gftat='git fetch --all --tags'
alias ggc='git gc'
alias ggcp='git gc --prune'
alias glf='git ls-files'
alias glfd='git ls-files --deleted'
alias glfi='git ls-files --ignored'
alias glfm='git ls-files --modified'
alias glfo='git ls-files --others'
alias glg='git log'
alias glgns='git log --name-status'
alias glgs='git log --stat'
alias glr='git ls-remote'
alias gmb='git merge-base'
alias gmg='git merge'
alias gmga='git merge --abort'
alias gmgc='git merge --continue'
alias gmgffo='git merge --ff-only'
alias gmgnff='git merge --no-ff'
alias gmv='git mv'
alias gpl='git pull --no-tags'
alias gplr='git pull --no-tags --rebase'
alias gplt='git pull --tags'
alias gps='git push'
alias gpsu='git push --set-upstream'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias grb='git rebase'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grl='git reflog'
alias grm='git rm'
alias grs='git reset'
alias grsh='git reset --hard'
alias grsh1='git reset --hard HEAD~1'
alias grsm1='git reset --mixed HEAD~1'
alias grss1='git reset --soft HEAD~1'
alias grsH='git reset HEAD'
alias grt='git remote'
alias grtad='git remote add'
alias grtrm='git remote remove'
alias grtrn='git remote rename'
alias grtv='git remote --verbose'
alias grv='git revert'
alias grva='git revert --abort'
alias grvc='git revert --continue'
alias grvnc='git revert --no-commit'
alias gsh='git stash'
alias gshl='git stash list'
alias gshp='git stash pop'
alias gshd='git stash drop'
alias gsm='git submodule'
alias gsmup='git submodule update'
alias gsmupir='git submodule update --init --recursive'
alias gsmupirr='git submodule update --init --recursive --remote'
alias gst='git status'
alias gsw='git show'
alias gswH='git show HEAD'
alias gsws0='git show stash@{0}'
alias gtg='git tag'
alias gtgl='git tag --list'
alias gtgd='git tag --delete'
alias gur='git update-ref'
alias gur-develop='git update-ref refs/heads/develop origin/develop'
alias gur-master='git update-ref refs/heads/master origin/master'
