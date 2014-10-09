#!/usr/bin/env bash

path="${BASH_SOURCE%/*}"

cd "$path"
path="$(pwd)"

read -p "Do you want to run git pull origin master first? (y/n) "
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
	git pull origin master
fi

function doIt() {
	#rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
	#	--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	cd ~
	# link .files except .os, .DS_Store
	find "$path" -type f -depth 1 -name '.*' -not \( -name '.osx' -or -name '.DS_Store' \) -exec ln -si {} \;
	# link .directories
	find "$path" -type d -depth 1 -name '.*' -not -name '.git' -exec ln -sFi {} \;
	# link bin symlinks
	rsync -anvh --no-perms "$path/bin" ./
	read -p "Do you want to replace these symlinks in ~/bin? (y/n) "
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		rsync -avh --no-perms "$path/bin" ./
	fi
	source ~/.bash_profile
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) "
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
	doIt
fi
unset doIt path
