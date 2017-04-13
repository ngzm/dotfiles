## Aliases
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

## Environments
export EDITOR=vim

## MacVim
if [ -d /Applications/MacVim.app ]; then
  PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
  alias gvim="open -a /Applications/MacVim.app"
fi

## nodebrew
if type nodebrew > /dev/null 2>&1; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

## rbenv
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

## ruby bundler
if type bundle > /dev/null 2>&1; then
  alias be='bundle exec'
fi
