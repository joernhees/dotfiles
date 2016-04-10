#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
brew install gnu-tar
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/less
brew install lesspipe
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install bfg
brew install nmap
brew install xpdf
brew install xz

# Install other useful binaries.
brew install git
brew install git-lfs
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install ssh-copy-id

brew install arp-scan
brew install boot2docker
brew install curl
brew install fdupes
brew install fuseki
brew install homebrew/boneyard/gptfdisk
brew install htop-osx
brew install jena
brew install jhead
brew install jq
brew install lzop
brew install memtester
brew install mplayer
brew install netcat
brew install homebrew/fuse/ntfs-3g
brew install pwgen
brew install pxz
brew install pyenv-virtualenv
brew install python3
brew install smartmontools
brew install tmux
brew install homebrew/completions/vagrant-completion
brew install wdiff

brew install mercurial
brew install node # This installs `npm` too using the recommended installation method

brew install dos2unix


# SciPy Stack: (see http://joernhees.de/blog/2014/02/25/scientific-python-on-mac-os-x-10-9-with-homebrew/)
brew tap homebrew/science
brew tap homebrew/python
brew install python

brew install freetype
brew install pillow
brew install imagemagick --with-webp
brew install graphviz
brew install cairo --without-x
brew install py2cairo
brew install qt pyqt

brew install numpy
brew install scipy
brew install matplotlib
brew install zeromq


# Remove outdated versions from the cellar.
brew cleanup
