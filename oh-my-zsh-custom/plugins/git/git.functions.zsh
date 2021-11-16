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
compdef _git gbrmrt=git-branch

# Checkout branch and rebase it onto another branch
function gcorbomb() {
  if [[ $# == 1 ]]; then
    local co='HEAD'
    local rbo="$1"
  elif [[ $# == 2 ]]; then
    local co="$1"
    local rbo="$2"
  else
    echo "Usage: ${0} [checkout_branch] rebase_onto_branch"
    return 1
  fi
  git rebase --onto ${rbo} "$(git merge-base ${co} ${rbo})" ${co}
}
compdef _git gcorbomb=git-rebase

# Open diff in vim
function gdfv() {
  git diff -w "$@" | view -
}
compdef _git gdfv=git-diff

# Interactively rebase the last n (up to 999) commits or whatever standard args apply
function grbi() {
  if [[ "${1}" =~ ^[0-9]{1,3}$ ]]; then
    local args="HEAD~${*}"
  else
    local args="${*}"
  fi
  git rebase --interactive ${args}
}
compdef _git grbi=git-rebase

# Update non-HEAD branch to its upstream (default: master)
function guru() {
  local branch
  [[ "$#" == 0 ]] \
    && branch='master' \
    || branch="$( git config "branch.$1.merge" | sed 's:.*/heads/::g' )"
  [[ -n ${branch} ]] && git update-ref refs/heads/${branch} "$( git config branch.${branch}.remote )/${branch}"
}
compdef _git guru=git-update-ref

# Warn if the current branch is a WIP
function work_in_progress() {
  if git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"; then
    echo "WIP!!"
  fi
}
