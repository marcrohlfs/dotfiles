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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  colorize
  command-not-found
  common-aliases
  extract
  git
  git-prompt
  osx
  per-directory-history
  systemadmin
  timer
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Avoid duplicates in history
setopt HIST_IGNORE_ALL_DUPS

# Add horizontal line to prompt
setopt promptsubst
PS1=$'${(r:$COLUMNS::\u2500:)}'$PS1

# Tab completion for 'cd ..'
zstyle ':completion:*' special-dirs true

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Use a template to create/update the .gitconfig file. This allows setting
# variables with values that should no be under version control.
[[ -f ${HOME}/.gitconfig.env ]] && source ${HOME}/.gitconfig.env
if [[ -f ${HOME}/.gitconfig && $( stat -f "%Sm" -t "%Y%m%d%H%M%S" ${HOME}/.gitconfig ) > $( stat -f "%Sm" -t "%Y%m%d%H%M%S" ${HOME}/.gitconfig.tmpl ) ]]; then
  cat ${HOME}/.gitconfig > ${HOME}/.gitconfig.tmpl
  touch -hm ${HOME}/.gitconfig ${HOME}/.gitconfig.tmpl
  echo "Copied ${HOME}/.gitconfig to ${HOME}/.gitconfig.tmpl because it has recent changes."
else
  GIT_SUBSTVARS_SET=true
  for ENV_VAR in $( envsubst --variables "$( cat ${HOME}/.gitconfig.tmpl )" ); do
    if [ -z "$( env | grep ${ENV_VAR} )" ]; then
      >&2 echo "Variable $ENV_VAR must be set! It's probably missing in ${HOME}/.gitconfig.env"
      GIT_SUBSTVARS_SET=false
    fi
  done
  if [[ "${GIT_SUBSTVARS_SET}" == "false" ]]; then
    >&2 echo "Not updating ${HOME}/.gitconfig because required variables are not set!"
  else
    envsubst < ${HOME}/.gitconfig.tmpl > ${HOME}/.gitconfig
    touch -hm ${HOME}/.gitconfig ${HOME}/.gitconfig.tmpl
  fi
fi

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
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gdfns='git diff --name-status'
alias gft='git fetch'
alias gftap='git fetch --all --prune --no-tags'
alias gftapt='git fetch --all --prune --tags'
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
alias gpl='git pull'
alias gplr='git pull --rebase'
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
alias gur-develop='git update-ref refs/heads/development origin/develop'
alias gur-master='git update-ref refs/heads/master origin/master'
alias la='ls -laFh'
alias latr='ls -laFhtr'
alias ll='ls -lFh'
alias lltr='ls -lFhtr'
unalias rm

# Install Homebrew casks to the main /Applications directory (instead of ~/Applications)
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
if [ -d "$SDKMAN_DIR" ]; then
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
else
  echo
  echo "SDKMAN! is not installed. Please call:"
  echo "  curl -s \"https://get.sdkman.io\" | bash"
  echo
fi

# Hook direnv into the shell
eval "$(direnv hook zsh)"
