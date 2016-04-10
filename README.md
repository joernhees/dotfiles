# Joern's dotfiles

based on https://github.com/mathiasbynens/dotfiles but modified:

![prompt](https://cloud.githubusercontent.com/assets/464192/4579958/73640e5e-4fd1-11e4-8436-5e14126eb9ca.png)

 - bash prompt (PS1):
   - prompt with return status indicator
   - date & time
   - git_prompt as distributed with git & python venv compatible
 - commented out most things that i don't use but found useful to know
 - deleted some things i didn't like and didn't find useful to know
 - `bootstrap.sh` symlinks stuff into your homedir instead of copying
   - always interactive
   - `init`, `.osx`, `brew.sh` and `cask.sh` aren't linked / copied to home dir

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/.dotfiles`.) The bootstrapper script will pull in the latest version and symlink them into your home folder.

```bash
git clone https://github.com/joernhees/dotfiles.git && cd dotfiles && ./bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
./bootstrap.sh
```

Afterwards you probably want to run the following commands to set your git credentials:
```bash
# not included to prevent others from committing in my name:
git config --global user.name "firstname lastname"
git config --global user.email "your@e.mail"
```


### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/joernhees/dotfiles/fork) instead, though.

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```


### Install native apps with `brew cask`

You could also install native apps with [`brew cask`](https://github.com/phinze/homebrew-cask):
```bash
./cask.sh
```


## Feedback

Suggestions/improvements [welcome](https://github.com/joernhees/dotfiles/issues)!

