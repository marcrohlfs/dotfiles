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
