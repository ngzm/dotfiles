# Aliases
alias la='ls -AGF'
alias ls='ls -GF'
alias ll='ls -lGF'
alias lla='ls -alGF'

## Environments
export EDITOR=vim

## MacVim
if [ -d /Applications/MacVim.app ]; then
  PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
  alias gvim="open /Applications/MacVim.app"
fi

## rbenv
eval "$(rbenv init -)"
