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

# Rename local and remote branch
function gbrmrt() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 old_branch new_branch"
    return 1
  fi

  # Rename branch locally
  git branch -m "$1" "$2"
  # Rename branch in origin remote
  if git push origin :"$1"; then
    git push --set-upstream origin "$2"
  fi
}

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
