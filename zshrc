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

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

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
ZSH_CUSTOM=${HOME}/.oh-my-zsh-custom

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
  sdk
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
