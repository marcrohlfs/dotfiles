#
# Custom Git aliases - most of them adopted from Oh My Zsh Git plugin
#

alias g='git'

alias "g?=git help"
alias ghp='git help'
local array git_commands=(
  ad:add am:am ap:apply
  bl:blame br:branch bs:bisect
  cf:config ci:commit cl:clone cn:clean co:checkout cp:cherry-pick
  dc:describe df:diff
  fp:format-patch ft:fetch
  gc:gc gr:grep in:init
  lf:ls-files lg:log lr:ls-remote
  mb:merge-base mg:merge mv:mv
  pl:pull pr:prune ps:push
  rb:rebase rl:reflog rm:rm rr:rerere rs:reset rst:restore rt:remote rv:revert
  sh:stash sl:shortlog sm:submodule st:status sw:show
  tg:tag
  ur:update-ref
  wc:whatchanged
)
for cmd in $git_commands; do
  alias "g${cmd%:*}=git ${cmd#*:}"
  alias "g?${cmd%:*}=git help ${cmd#*:}"
  alias "g${cmd%:*}?=git ${cmd#*:} --help"
done

alias gada='git add --all'
alias gadp='git add --patch'
alias gadu='git add --update'
alias gadv='git add --verbose'

alias gama='git am --abort'
alias gamc='git am --continue'
alias gams='git am --skip'

alias gbl='git blame -b -w'

alias gbra='git branch --all'
alias gbrd='git branch --delete'
alias gbrd!='git branch --delete --force'
alias gbrm='git branch --move'
alias gbrmg='git branch --merged | command grep -vE "^(\+|\*|\s*(${GIT_PROTECTED_BRANCH_PATTERNS})\s*$)"'
alias gbrmgd='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(${GIT_PROTECTED_BRANCH_PATTERNS})\s*$)" | command xargs -n 1 git branch --delete'
alias gbrnmg='git branch --no-merged'
alias gbrr='git branch --remotes'
alias gbrrv='git branch --remotes --verbose'
alias gbrsu='git branch --set-upstream-to'
alias gbrsuc='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gbruu='git branch --unset-upstream'
alias gbrvv='git branch -vv'
alias gbrvva='git branch -vv --all'

alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gcfa='git config --add'
alias gcfag='git config --add --global'
alias gcfal='git config --add --local'
alias gcfas='git config --add --system'
alias gcfl='git config --list | sort'
alias gcflg='git config --list --global | sort'
alias gcfll='git config --list --local | sort'
alias gcfls='git config --list --system | sort'
alias gcfu='git config --unset'
alias gcfug='git config --unset --global'
alias gcful='git config --unset --local'
alias gcfus='git config --unset --system'

alias gci='git commit --verbose'
alias gci!='git commit --all --verbose'
alias gcia='git commit --amend --verbose'
alias gcia!='git commit --amend --all --verbose'
alias gcian='git commit --amend --no-edit --verbose'
alias gcian!='git commit --amend --no-edit --all --verbose'

alias gcl='git clone --recurse-submodules --no-tags'
alias gclb='git clone --recurse-submodules --no-tags --bare'

alias gcnf='git clean --force'
alias gcnfd='git clean --force -d'
alias gcni='git clean --interactive'
alias gcnid='git clean --interactive -d'

alias gcob='git checkout --no-track -b'

alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcpnc='git cherry-pick --no-commit'
alias gcps='git cherry-pick --skip'

alias gdfc='git diff --cached'
alias gdfs='git diff --staged'
alias gdfuc='git diff origin/$(git_current_branch)'
alias gdfluc='git diff $(git_current_branch) origin/$(git_current_branch)'

alias gfta='git fetch --all --no-tags'
alias gftant='git fetch --all --no-tags'
alias gftat='git fetch --all --tags'

alias gfp='git format-patch --keep-subject'
alias gfpo='git format-patch --keep-subject --output-directory'

alias ggcp='git gc --prune'

alias glfd='git ls-files --deleted'
alias glfi='git ls-files --ignored'
alias glfm='git ls-files --modified'
alias glfo='git ls-files --others'

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

alias gmba='git merge-base --all'

alias gmga='git merge --abort'
alias gmgc='git merge --continue'
alias gmgffo='git merge --ff-only'
alias gmgnff='git merge --no-ff'

alias gpl='git pull --no-tags'
alias gplsh='git pull --no-tags --autostash'
alias gplt='git pull --tags'
alias gpltsh='git pull --tags --autostash'

alias gpristine='git reset --hard && git clean -dx --force'

alias gps='git push --set-upstream'
alias gps!='git push --force-with-lease'
alias gps!!='git push --force'
alias gpsd!='git push --dry-run --force-with-lease'
alias gpsd!!='git push --dry-run --force'
alias gpst='git push --tags'
alias gpstd='git push --tags  --dry-run'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'

alias grmc='git rm --cached'

alias grrcl='git rerere clear'
alias grrdf='git rerere diff'
alias grrfg='git rerere forget'
alias grrgc='git rerere gc'
alias grrrg='git rerere remaining'
alias grrst='git rerere status'

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

alias grsts='git restore --staged'
alias grstw='git restore --worktree'

alias grtad='git remote add'
alias grtrm='git remote remove'
alias grtrn='git remote rename'
alias grtsu='git remote set-url'
alias grtup='git remote update'
alias grtv='git remote --verbose'

alias grva='git revert --abort'
alias grvc='git revert --continue'
alias grvnc='git revert --no-commit'
alias grvs='git revert --skip'

alias gshd='git stash drop'
alias gshl='git stash list'
alias gshp='git stash pop'
alias gshs='git stash show --text'
alias gshu='git stash --include-untracked'

alias gsmup='git submodule update'
alias gsmupir='git submodule update --init --recursive'
alias gsmupirr='git submodule update --init --recursive --remote'

alias gsts='git status --short'
alias gstsb='git status --short --branch'

alias gswH='git show HEAD'
alias gsws0='git show stash@{0}'

alias gtg1='git describe --tags $(git rev-list --tags --max-count=1)'
alias gtgl='git tag --list'
alias gtgls='git tag --list | sort -V'
alias gtgd='git tag --delete'

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
