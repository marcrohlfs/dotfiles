#
# Custom Git functions - most of them adopted from Oh My Zsh Git plugin
#

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
compdef _git _git_log_prettily=git-log

# Open diff in vim
function gdfv() { git diff -w "$@" | view - }
compdef _git gdfv=git-diff

# Update non-HEAD branch to its upstream (default: master)
function guru() {
  [[ "$#" == 0 ]] \
    && local b='master' \
    || local b="$( git config branch.$1.merge | sed 's:.*/heads/::g' )"
  [[ -n "${b}" ]] && git update-ref "refs/heads/${b}" "$( git config branch.${b}.remote )/${b}"
}

# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}
