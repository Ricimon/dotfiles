# https://stackoverflow.com/a/26759734
if [ -x "$(command -v nvim)" ]; then
    export EDITOR='nvim'
elif [ -x "$(command -v vim)" ]; then
    export EDITOR='vim'
elif [ -x "$(command -v vi)" ]; then
    export EDITOR='vi'
fi

[ -f ~/.bash_aliases ] && source ~/.bash_aliases

export PYTHON_CONFIGURE_OPTS="--enable-shared"
if [ -d ~/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi

# computer-specific bash configs
[ -f ~/.config.bash ] && source ~/.config.bash

# end-of-shell-initialization commands
# enable pyenv shims, autocompletion, and virtualenv
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    if command -v virtualenv 1>/dev/null 2>&1; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

true # exit with success, as not having the last initialization package will exit with an error code
