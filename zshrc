# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder    # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 21

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${HOME}/.oh-my-zsh-custom

# Add Rancher Desktop binaries to the PATH if available/installed.
[[ -d ${HOME}/.rd/bin ]] && export PATH="${HOME}/.rd/bin:${PATH}"

# Add custom binaries to the PATH.
export PATH="${HOME}/bin:${PATH}"

# Source env settings that are not under version control
if [[ -f ${HOME}/.zsh.env ]]; then
  source ${HOME}/.zsh.env
else
  echo "Add '${HOME}/.zsh.env' to provide local settings."
fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aliases
  autojump
  brew
  colorize
  common-aliases
  direnv
  extract
  git
  git-prompt
  iterm2
  jsontools
  macos
  per-directory-history
  sdk
  systemadmin
  timer
)
[[ -n $( command -v docker ) ]] && plugins+=(docker)
[[ -n $( command -v docker-compose ) ]] && plugins+=(docker-compose)
[[ -n ${JIRA_URL} ]] && plugins+=(jira)
[[ -d /opt/homebrew/opt/nvm/ || -d /usr/local/opt/nvm/ ]] && plugins+=(nvm)
[[ ${GIT_USER_EMAIL} == *coremedia.com ]] && plugins+=(coremedia)

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
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Override commands provided by macOS with the GNU version if coreutils are installed. OMZ must be loaded first!
[[ -d ${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin ]] && export PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:${PATH}"

# Install Homebrew casks to the main /Applications directory (instead of ~/Applications)
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
if [ -d "$SDKMAN_DIR" ]; then
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
else
  echo
  echo "SDKMAN! is not installed. Please call:"
  echo "  curl -s 'https://get.sdkman.io?rcupdate=false' | bash"
  echo
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/mrohlfs/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
