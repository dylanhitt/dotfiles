# ============================================================================
# PATH Configuration
# ============================================================================
export PATH="${HOME}/bin:/usr/local/bin:${PATH}"
export PATH="/opt/homebrew/bin:${PATH}"
export PATH="/opt/local/bin:/opt/local/sbin:${PATH}"
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="${PATH}:${HOME}/go/bin"
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${HOME}/.rbenv/bin:${PATH}"
export PATH="${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:${PATH}"

export PNPM_HOME="/Users/dhitt/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:${PATH}" ;;
esac

export MANPATH="/opt/local/share/man:${MANPATH}"

# ============================================================================
# Oh-My-Zsh Configuration
# ============================================================================
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  kube-ps1
)

source $ZSH/oh-my-zsh.sh

RPROMPT='$(kube_ps1)'

# ============================================================================
# Tool Initialization
# ============================================================================
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# rbenv
eval "$(rbenv init - zsh)"

# ============================================================================
# Aliases
# ============================================================================
alias k='kubectl'
alias kn='kubens'
alias gcan='git commit --amend --no-edit'
alias gpf='git push --force-with-lease'

# ============================================================================
# Environment Variables
# ============================================================================
export PRE_COMMIT_FORMAT=enabled

# AWS/Claude Code
export CLAUDE_CODE_USE_BEDROCK=1
export CLAUDE_CODE_AWS_PROFILE=sandbox
export AWS_REGION=us-west-2