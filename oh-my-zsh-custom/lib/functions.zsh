# Custom functions

# Source default functions first
source "${ZSH}/lib/functions.zsh"

# Change the name of an alias
function chalias() {
  local from=$1
  local to=$2
  alias "${to}=$( alias_value "${from}" )"
  unalias "${from}"
}
