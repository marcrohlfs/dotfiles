#
# Custom Git configurations, functions and aliases
#

if [[ -z "${GIT_PROTECTED_BRANCH_PATTERNS}" ]]; then
  export GIT_PROTECTED_BRANCH_PATTERNS='master|develop'
fi

local git_plugin_dir=${0:h}
source ${git_plugin_dir}/git.functions.zsh
source ${git_plugin_dir}/git.aliases.zsh
source ${git_plugin_dir}/git.config.zsh

# Disable completions from (Homebrew) Git installations
mkdir -p /usr/local/share/zsh/site-functions/disabled
for GIT_COMP_FILE in $( ls -1 /usr/local/share/zsh/site-functions | grep git ); do
  mv -fv /usr/local/share/zsh/site-functions/${GIT_COMP_FILE} /usr/local/share/zsh/site-functions/disabled/${GIT_COMP_FILE}
done
