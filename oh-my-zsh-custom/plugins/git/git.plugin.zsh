#
# Custom Git configurations, functions and aliases
#

if [[ -z "${GIT_PROTECTED_BRANCH_PATTERNS}" ]]; then
  export GIT_PROTECTED_BRANCH_PATTERNS='main|master|develop'
fi

git_plugin_dir=${0:h}
source "${git_plugin_dir}/git.functions.zsh"
source "${git_plugin_dir}/git.aliases.zsh"
source "${git_plugin_dir}/git.config.zsh"
unset git_plugin_dir

# Disable completions from (Homebrew) Git installations
mkdir -p ${HOMEBREW_PREFIX}/share/zsh/site-functions/disabled
find ${HOMEBREW_PREFIX}/share/zsh/site-functions -path '*git*' -depth 1 \
    -exec mv -fv {} ${HOMEBREW_PREFIX}/share/zsh/site-functions/disabled/ \;
