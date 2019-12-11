# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export WORKON_HOME=~/.virtualenv
export PROJECT_HOME=~/workspace
pyenv virtualenvwrapper_lazy
