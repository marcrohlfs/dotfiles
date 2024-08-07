# Dotfiles

Management of configuration files for my workstations.

## Prerequisites

### Zsh

Change the default login shell to Zsh on Mac:

1. Open _System Preferences_
2. Go to _Users & Groups_
3. Ensure that making changes is unlocked
4. Right click the current user and select _Advanced Options..._
5. Select _Login Shell_: ``/bin/zsh``
6. Confirm with _OK_

### Homebrew

Install Homebrew:

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Installation

Install Dotfiles:

    cd ${HOME}
    git clone --recurse-submodules https://github.com/marcrohlfs/dotfiles.git .dotfiles
    cd .dotfiles
    ./install

## Configuration

To provide custom (and secret) settings, create a file named `.zsh.env` in your home directory.

Here are some settings used by this setup:

```shell
# Configure the .gitconfig file based on the oh-my-zsh-custom/plugins/git/gitconfig.tmpl.
export GIT_USER_NAME='Your Name'
export GIT_USER_EMAIL=your.email@your.org
export GIT_USER_SIGNINGKEY=[THE_SIGNINGKEY_IF_COMMIT_SIGNING_IS_WANTED_OR_OMIT]

# The protected branches that won't appear or be deleted when using the aliases 'gbrmg' or 'gbrmgd'.
export GIT_PROTECTED_BRANCH_PATTERNS='main|master|maintenance-.*'

# Setting the JIRA_URL loads the Oh My Zsh's 'jira' plugin.
export JIRA_URL=[THE_JIRA_URL]
```
