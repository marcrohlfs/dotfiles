#
# Custom Git configurations, functions and aliases for work at CoreMedia
#

plugin_dir=${0:h}

# Load tool-specific settings
source "${plugin_dir}/aws.zsh"
source "${plugin_dir}/maven.zsh"

# Add scripts to PATH
ln -sfn ${plugin_dir}/checkout/ci-ssh/ci-ssh.bash ${plugin_dir}/bin/ci-ssh
ln -sfn ${plugin_dir}/checkout/ci-trigger/ci-trigger.bash ${plugin_dir}/bin/ci-trigger
ln -sfn ${plugin_dir}/checkout/pr-integrate/pr-integrate.bash ${plugin_dir}/bin/pr-integrate
export PATH="${plugin_dir}/bin:${PATH}"

unset plugin_dir
