#
# Custom Git aliases - most of them adopted from Oh My Zsh Git plugin
#

alias g='git'

alias "g?=git help"
alias ghp='git help'
local array git_commands=(
  ad:add am:am ap:apply bs:bisect bl:blame br:branch ct:cat-file
  cn:clean co:checkout cp:cherry-pick cl:clone ci:commit cf:config
  dc:describe df:diff ft:fetch fp:format-patch gc:gc gr:grep in:init
  lg:log lgs:shortlog lf:ls-files lr:ls-remote mg:merge mb:merge-base
  mv:mv pr:prune prp:prune-packed pl:pull ps:push rb:rebase rl:reflog
  rt:remote re:rerere rs:reset rst:restore rv:revert rm:rm sw:show
  sh:stash st:status sm:submodule tg:tag ur:update-ref wc:whatchanged
)
for cmd in $git_commands; do
  alias "g?${cmd%:*}=git help ${cmd#*:}"
  alias "g${cmd%:*}?=git ${cmd#*:} --help"
done

alias gad='git add'
alias gada='git add --all'
alias gadp='git add --patch'
alias gadu='git add --update'
alias gadv='git add --verbose'

alias gam='git am'

alias gap='git apply'

alias gbl='git blame -b -w'

alias gbr='git branch'
alias gbra='git branch --all'
alias gbrd='git branch --delete'
alias gbrd!='git branch --delete --force'
alias gbrm='git branch --move'
alias gbrmg='git branch --merged'
alias gbrmgd='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|maintenance|merge-base)\s*$)" | command xargs -n 1 git branch --delete'
alias gbrnmg='git branch --no-merged'
alias gbrr='git branch --remotes'
alias gbrsu='git branch --set-upstream-to'
alias gbrsuc='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gbruu='git branch --unset-upstream'
alias gbrvv='git branch -vv'
alias gbrvva='git branch -vv --all'

alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gcf='git config'
alias gcfa='git config --add'
alias gcfag='git config --add --global'
alias gcfal='git config --add --local'
alias gcfas='git config --add --system'
alias gcfl='git config --list'
alias gcflg='git config --list --global'
alias gcfll='git config --list --local'
alias gcfls='git config --list --system'
alias gcfu='git config --unset'
alias gcfug='git config --unset --global'
alias gcful='git config --unset --local'
alias gcfus='git config --unset --system'

alias gci='git commit --verbose'
alias gci!='git commit --verbose --all'
alias gcia='git commit --amend --verbose'
alias gcia!='git commit --amend --verbose --all'
alias gcian='git commit --amend --no-edit --verbose'
alias gcian!='git commit --amend --no-edit --verbose --all'

alias gcl='git clone --recurse-submodules --no-tags'
alias gclb='git clone --recurse-submodules --no-tags --bare'

alias gcn='git clean'
alias gcnf='git clean --force'
alias gcnfd='git clean --force -d'
alias gcni='git clean --interactive'
alias gcnid='git clean --interactive -d'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcpn='git cherry-pick --no-commit'
alias gcps='git cherry-pick --skip'

# Change aliases and functions for 'git diff' from 'gd*' to 'gdf*' (and drop some)
alias gdf='git diff'
alias gdfs='git diff --cached'
alias gdfs='git diff --staged'

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
alias glgg='git log --graph'
alias glgga='git log --graph --all'
alias glggd="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glggds="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glggl="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glggla="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glggls="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glgns='git log --name-status'
alias glgo='git log --oneline'
alias glgp="_git_log_prettily"
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
alias gplsh='git pull --no-tags --autostash'
alias gplt='git pull --tags'
alias gpltsh='git pull --tags --autostash'

alias gpristine='git reset --hard && git clean -dx --force'

alias gps='git push'
alias gps!='git push --force-with-lease'
alias gps!!='git push --force'
alias gpsd!='git push --dry-run --force-with-lease'
alias gpsd!!='git push --dry-run --force'
alias gpst='git push --tags'
alias gpstd='git push --tags  --dry-run'
alias gpsu='git push --set-upstream'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'

alias grl='git reflog'

alias grm='git rm'
alias grmc='git rm --cached'

alias grs='git reset'
alias grsH='git reset HEAD'
alias grsh='git reset --hard'
alias grsh1='git reset --hard HEAD~1'
alias grshuc='git reset --hard origin/$(git_current_branch)'
alias grsm='git reset --mixed'
alias grsm1='git reset --mixed HEAD~1'
alias grsmuc='git reset --mixed origin/$(git_current_branch'
alias grss='git reset --soft'
alias grss1='git reset --soft HEAD~1'
alias grssuc='git reset --soft origin/$(git_current_branch'

alias grt='git remote'
alias grtad='git remote add'
alias grtrm='git remote remove'
alias grtrn='git remote rename'
alias grtsu='git remote set-url'
alias grtup='git remote update'
alias grtv='git remote --verbose'

alias grv='git revert'
alias grva='git revert --abort'
alias grvc='git revert --continue'
alias grvnc='git revert --no-commit'
alias grvs='git revert --skip'

alias gsh='git stash'
alias gshl='git stash list'
alias gshp='git stash pop'
alias gshd='git stash drop'
alias gshs='git stash show --text'

alias gsm='git submodule'
alias gsmup='git submodule update'
alias gsmupir='git submodule update --init --recursive'
alias gsmupirr='git submodule update --init --recursive --remote'

alias gst='git status'
alias gsts='git status --short'
alias gstsb='git status --short --branch'

alias gsw='git show'
alias gswH='git show HEAD'
alias gsws0='git show stash@{0}'

alias gtg='git tag'
alias gtg1='git describe --tags $(git rev-list --tags --max-count=1)'
alias gtgl='git tag --list'
alias gtgls='git tag --list | sort -V'
alias gtgd='git tag --delete'

alias gur='git update-ref'

alias gtk='\gitk --all &'
alias gtkrl='\gitk --all $(git log --walk-reflogs --pretty=%h) &'

# Git ignore
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gunignore='git update-index --no-assume-unchanged'

# Jump to project/clone root dir
alias gjr='cd "$(git rev-parse --show-toplevel || echo .)"'

# Work in progress
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'