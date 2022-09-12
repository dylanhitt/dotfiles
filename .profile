PATH="/usr/local/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
fi

PS1='\[\033[01;32m\]\u@local\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)")]\$ '
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"

export PATH="/opt/homebrew/opt/node@12/bin:$PATH"
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##
# Your previous /Users/dhitt/.bash_profile file was backed up as /Users/dhitt/.bash_profile.macports-saved_2022-08-04_at_23:18:34
##

# MacPorts Installer addition on 2022-08-04_at_23:18:34: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2022-08-04_at_23:18:34: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="${PATH}:${HOME}/go/bin"