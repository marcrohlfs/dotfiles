#
# Maintain custom Git configuration
#

# Use a template to create/update the .gitconfig file. This allows setting
# variables with values that should no be under version control.
if [[ -f ${HOME}/.gitconfig && $( stat -f "%Sm" -t "%Y%m%d%H%M%S" ${HOME}/.gitconfig ) > $( stat -f "%Sm" -t "%Y%m%d%H%M%S" ${git_plugin_dir}/gitconfig.tmpl ) ]]; then
  cat ${HOME}/.gitconfig > ${git_plugin_dir}/gitconfig.tmpl
  touch -hm ${HOME}/.gitconfig ${git_plugin_dir}/gitconfig.tmpl
  echo "Copied ${HOME}/.gitconfig to ${git_plugin_dir}/gitconfig.tmpl because it has recent changes."
else
  GIT_SUBSTVARS_SET=true
  for ENV_VAR in $( LANG=en_US.UTF-8 envsubst --variables "$( cat ${git_plugin_dir}/gitconfig.tmpl )" ); do
    if [ -z "$( env | grep ${ENV_VAR} )" ]; then
      >&2 echo "Variable ${ENV_VAR} must be set!"
      GIT_SUBSTVARS_SET=false
    fi
  done
  if [[ "${GIT_SUBSTVARS_SET}" == "false" ]]; then
    >&2 echo "Not updating ${HOME}/.gitconfig because required variables are not set!"
  else
    LANG=en_US.UTF-8 envsubst < ${git_plugin_dir}/gitconfig.tmpl > ${HOME}/.gitconfig
    touch -hm ${HOME}/.gitconfig ${git_plugin_dir}/gitconfig.tmpl
  fi
fi
