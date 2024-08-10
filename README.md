# Summary

This is a perpetually in motion config for my mac. Use at your own risk.

## Bootstrap

1) Open a new Terminal
2) Install Nix ``sh <(curl -L https://nixos.org/nix/install)``
3) Install Brew ``/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"``
4) Close the Terminal app and open a new terminal
5) Install git with Brew ``brew install git`` (you may need to source brew)
6) Clone this repo to src (or modify below accordingly)
7) Install the flake ``nix  --extra-experimental-features "nix-command flakes" run nix-darwin -- switch --flake ~/src/tamanoya-nix``

## Core Apps

## Extras
### fixMacOS.sh
Not run by default. Located in Modules/home-manager/dotfiles.

This shell script uses the defaults command to set the following:
1) Turns off click on the desktop to show desktop behavior
2) Turns on Dock Auto Hide
3) Sets Dock tile size to 55
4) Puts Dock on the Left Side
5) Sets Trash to auto-empty items older than 30 days
6) Sets default Finder view to List
7) Turns off seperate spaces for each screen

### nixup
Once installed, you can run ``nixup`` in the terminal to fully update the flake.

### nixclean
Once installed, you can run ``nixclean`` to empty old build cache.