# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
install gnu-sed
install gnu-tar
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
install bash
install bash-completion

# Install wget with IRI support
install wget --enable-iri

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep
install homebrew/dupes/screen

# Install some CTF tools; see https://github.com/ctfs/write-ups
install nmap
install xz

# Install other useful binaries
install git
install bfg

install mercurial

install node # This installs `npm` too using the recommended installation method

install dos2unix


# SciPy Stack: (see http://joernhees.de/blog/2014/02/25/scientific-python-on-mac-os-x-10-9-with-homebrew/)
tap homebrew/science
tap homebrew/python
install python

install freetype
install pillow
install imagemagick --with-webp
install graphviz
install cairo --without-x
install py2cairo
install qt pyqt

install numpy
install scipy
install matplotlib
install zmq


# Remove outdated versions from the cellar
cleanup
