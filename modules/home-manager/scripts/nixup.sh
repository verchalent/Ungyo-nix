#!/usr/bin/env bash
# Script to update Brew, NixOS and ensure defaults applied

# Set Wallpaper - no fun Nix way to do this yet :)
# osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$(dirname "$PWD")/wallpaper/JackFrost.jpg\"" #Trowing an error, so commenting out for now
# Update and clean up Brew
brew update 
brew upgrade 
brew cleanup --prune=all

# Update and clean up Nix
pushd ~/src/Ungyo-Nix
nix flake update
sudo darwin-rebuild switch --flake /Users/justin/src/Ungyo-Nix/.#
popd