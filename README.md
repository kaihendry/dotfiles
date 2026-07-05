# Setup

Checked out directly into $HOME:

	cd
	git init -b main
	git remote add origin git@github.com:kaihendry/dotfiles.git
	git fetch origin
	git reset --hard origin/main
	git branch -u origin/main

# Homebrew

	brew bundle --global          # install everything from ~/.Brewfile
	brew bundle dump --global -f  # re-dump after installing/removing

# Switch login shell to Homebrew bash

macOS ships zsh as the default and an ancient bash 3.2. chsh refuses
shells not listed in /etc/shells, so:

	brew install bash
	echo /opt/homebrew/bin/bash | sudo tee -a /etc/shells
	chsh -s /opt/homebrew/bin/bash

Open a new terminal and verify with `echo $BASH_VERSION`.

# AWS

`.aws/config` defines the `mine` profile — my personal AWS account
(SSO via `aws sso login --sso-session mine`). Scripts like
`bin/upload` use it as `AWS_PROFILE=mine` / `--profile mine`.

# macOS settings

Keyboard changes need a log out/in to take effect.

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

## Raycast

Settings live in encrypted sqlite, not dotfiles. On the old machine:

	open "raycast://extensions/raycast/raycast/export-settings-data"

Export produces a password-protected .rayconfig — keep it out of this
repo. On the new machine, double-click it (or Settings → Advanced →
Import) after installing Raycast from the Brewfile.

## Kill notifications

No `defaults` for this one. System Settings → Focus → Reduce
Interruptions: schedule 00:00–23:59 every day, Allowed People and
Allowed Apps both none. Permanent silence.
