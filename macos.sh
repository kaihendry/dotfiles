#!/bin/bash
# New MBP settings, dumped from the live machine
# Keyboard changes need a log out/in to take effect

# Keyboard: fastest key repeat, shortest delay (the GUI slider maximums)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Dock: autohide, smallest tiles
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 16

# Finder: list view, search the current folder, show all file extensions
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

killall Dock Finder
