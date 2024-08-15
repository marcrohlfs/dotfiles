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
    local rbo="$1"
    local co='HEAD'
  elif [[ $# == 2 ]]; then
    local rbo="$1"
    local co="$2"
  else
    echo "Usage: ${0} rebase_onto_branch [checkout_branch]"
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

# Rebase local branches onto the latest remote of their base branch and also update the local base branch itself.
function git_update_local_branches() {
  git fetch --all --no-tags

  declare -a base_branches rebase_branches
  for branch in $( git for-each-ref --format='%(refname)' refs/heads/ ); do
    simple_branch=$( echo ${branch} | sed 's/refs\/heads\///' )
    if [[ ${simple_branch} =~ ^(${GIT_PROTECTED_BRANCH_PATTERNS})$ ]]; then
      base_branches+=(${simple_branch})
    else
      rebase_branches+=(${simple_branch})
    fi
  done

  if [[ -n "${1}" ]]; then
    base_branches=(${1})
  fi

  local base_branch
  if [[ ${#base_branches} != 1 ]]; then
    echo "Expecting exactly one base but found ${#base_branches[*]}: ${base_branches}"
    echo "Please specify the base branch manually: ${0} [base_branch]"
    return 1
  fi
  base_branch=${base_branches[*]}

  for rebase_branch in ${rebase_branches[*]}; do
    if git merge-base --is-ancestor ${rebase_branch} origin/${base_branch}; then
      echo "-> Deleting because already merged into origin/${base_branch}: ${rebase_branch}"
      git branch --delete --force ${rebase_branch} || return 1
    elif git merge-base --is-ancestor origin/${base_branch} ${rebase_branch}; then
      echo "-> Obsolete because already rebased onto origin/${base_branch}: ${rebase_branch}"
    elif ! git merge-base --is-ancestor ${base_branch} ${rebase_branch}; then
      echo "-> Ignoring because not based on ${base_branch}: ${rebase_branch}"
    else
      echo "-> Rebasing onto origin/${base_branch}: ${rebase_branch}"
      git rebase origin/${base_branch} ${rebase_branch} || return 1
    fi
  done

  echo "-> Updating ${base_branch} to origin/${base_branch}"
  git checkout ${base_branch}
  git merge --ff-only origin/${base_branch} || return 1
  echo "-> Successfully updated local branches based on ${base_branch}."
}

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
