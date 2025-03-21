# Source bashrc
# if [ -f ~/.bashrc ]; then
#   source ~/.bashrc
# fi
# Add `~/bin` to the `$PATH`
# Removed adding bin to path here and moved to .path file
# export PATH="$HOME/bin:$PATH";

export PATH=$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:${RVM_HOME}:${RUBY_HOME}:${GEM_HOME}:${MAVEN_HOME}:${JAVA_HOME}:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:~/bin:/snap/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,exports,extra}; do
		[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Set Vim editing Option in terminal
set -o vi

# Shell only exists after 3 consecutive Ctrl d
IGNOREEOF=3

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add git-completion support for Git
source $HOME/.git-completion.bash

# Make sure AWS completion is added
if [ -x "$(command -v aws)" ]; then
  complete -C '/usr/local/bin/aws_completer' aws
fi
# source /usr/local/bin/git-prompt.sh

# Print nickname for git/hg/bzr/svn version control in CWD
# Optional $1 of format string for printf, default "(%s)"
if [[ ! -f ~/.git-prompt.sh  ]]; then
	curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

source $HOME/.git-prompt.sh

# Add in conda init if only bash profile run
__conda_file=$HOME/miniconda3/etc/profile.d/conda.sh
if ! [ -x "$(command -v conda)" ] && [ -f "$__conda_file" ]; then
  . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi
unset __conda_file

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fix for fzf completion in tmux
# complete -o nospace -o plusdirs -F _fzf_dir_completion cd

source $HOME/.local/opt/fzf-obc/bin/fzf-obc.bash
. "$HOME/.cargo/env"
