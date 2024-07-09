#!/usr/bin/env bash

# Script to change additional MacOS and app settings outside of nix

##########################
# Desktop and Dock Settings
##########################

# Disable Click Wallpaper to reveal desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Dock
defaults write com.apple.dock "autohide" -bool "true" #autohide
defaults write com.apple.dock "tilesize" -int "55" # Set Icon Size for desktop panel
defaults write com.apple.dock "orientation" -string "left" # Dash on Left


# Remove trash after 30 days
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"

# Default to List View in Finder
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"

##########################
# Notification Settings
##########################

# Disable Notification Center and remove the menu bar icon
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null # Doesn't work properly :(



##########################
# Default App Settings
##########################


##########################
# Keyboard shortcut Changes
##########################


##########################
# Raycast Settings
##########################

# turn off game mode