# actually seems problematic for tmux
# # only run once, even if external weirdness calls us multiple times
# if [[ $BASH_PROFILE_IMPORT_GUARD = true ]] ; then
# 	echo "skipping ~/.bash_profile due to import guard"
# 	return
# fi
# export BASH_PROFILE_IMPORT_GUARD=true
echo "executing ~/.bash_profile"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Append to history after each command
#export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

echo -n "history: "
wc -l "$HISTFILE"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/local/bin/lesspipe.sh ] ; then
	eval "$(/usr/local/bin/lesspipe.sh)"
elif [ -x /usr/bin/lesspipe ] ; then
	eval "$(/usr/bin/lesspipe)"
fi


# support autocorrect "fuck" command
#if which thefuck &> /dev/null ; then
#	eval "$(thefuck --alias)"
#fi


# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# travis auto-completion
[[ -f ~/.travis/travis.sh ]] && source ~/.travis/travis.sh

# make first bash prompt happy ("green") even if parts weren't found
true
