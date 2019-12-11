PACKAGES=(
  pyenv
  pyenv-virtualenvwrapper
)

PYTHON_VERSIONS=(
  3.7.2
  2.7.16
)

echo "Installing Python Version Management Tools..."
brew install ${PACKAGES[@]}

echo "Installing different python versions..."
pyenv install ${PYTHON_VERSIONS[@]}

echo "Setting global python version..."
pyenv global "${PYTHON_VERSIONS[*]}"

echo "Setting environment variables"
cat sample.zshrc ~/.zshrc >  ~/tmp.zshrc && mv ~/tmp.zshrc ~/.zshrc

echo "Setup complete.\nRestart your shell and use \`mkvirtualenv\` to start a virtual environment."
