# Setup

	git init
	git remote add origin git@github.com:kaihendry/dotfiles.git
	git pull origin main

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

	./macos.sh

Sets max keyboard repeat (log out/in to apply), tiny autohidden Dock,
and Finder to list view / current-folder search / show all extensions.

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
