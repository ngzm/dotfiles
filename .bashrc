## Aliases
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias h='history'

## Environments
export EDITOR=vim

## brew gettext
if [ -d /usr/local/opt/gettext ]; then
  export PATH="/usr/local/opt/gettext/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/gettext/lib"
  export CPPFLAGS="-I/usr/local/opt/gettext/include"
fi

## MacVim
if [ -d /Applications/MacVim.app ]; then
  export PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
  alias gvim="open -a /Applications/MacVim.app"
fi

## neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
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

## pyenv
if type pyenv > /dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
