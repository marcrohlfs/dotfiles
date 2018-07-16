# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gad='git add'
alias gada='git add --all'
alias gbr='git branch'
alias gbrd='git branch --delete'
alias gbrD='git branch --delete --force'
alias gbrm='git branch --move'
alias gbrvv='git branch -vv'
alias gbrvva='git branch -vva'
alias gcf='git config'
alias gcfa='git config --add'
alias gcfl='git config --list'
alias gci='git commit'
alias gcia='git commit --amend'
alias gcl='git clone'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias gcpnc='git cherry-pick --no-commit'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gft='git fetch'
alias gftap='git fetch --all --prune --no-tags'
alias gftapt='git fetch --all --prune --tags'
alias ggc='git gc'
alias ggcp='git gc --prune'
alias glf='git ls-files'
alias glfd='git ls-files --deleted'
alias glfi='git ls-files --ignored'
alias glfm='git ls-files --modified'
alias glg='git log'
alias glgns='git log --name-status'
alias glgs='git log --stat'
alias gmg='git merge'
alias gmga='git merge --abort'
alias gmgc='git merge --continue'
alias gmgffo='git merge --ff-only'
alias gmgnff='git merge --no-ff'
alias gmv='git mv'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpS='git push --force'
alias gpsd='git push --delete'
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
alias grtad='git remote add'
alias grtrm='git remote remove'
alias grtrn='git remote rename'
alias grtv='git remote --verbose'
alias grv='git revert'
alias grva='git revert --abort'
alias grvc='git revert --continue'
alias gsh='git stash'
alias gshl='git stash list'
alias gshp='git stash pop'
alias gshd='git stash drop'
alias gsm='git submodule'
alias gsmup='git submodule update'
alias gst='git status'
alias gsw='git show'
alias gtg='git tag'
alias gtgl='git tag --list'
alias gtgd='git tag --delete'
alias gur='git update-ref'
alias gur-develop='git update-ref refs/heads/development origin/develop'
alias gur-master='git update-ref refs/heads/master origin/master'
