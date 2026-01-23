# Git completion and prompt
if [ -f ~/.git-completion.bash ]; then
  . "${HOME}/.git-completion.bash"
fi

if [ -f ~/.git-prompt.sh ]; then
  . "${HOME}/.git-prompt.sh"
fi

PS1='\[\033[01;32m\]\u@local\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)")]\$ '
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

# Additional PATH entries
export PATH="/usr/local/bin:${PATH}:${HOME}/.krew/bin:${HOME}/go/bin:/usr/local/go/bin"