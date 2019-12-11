K8S_PACKAGES=(
  kubernetes-cli
  kubernetes-helm
  kubectx
)

PACKAGES=(
  zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
)

CASKS=(
  docker
  atom
  iterm2
  postman
  1password
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing astro cli..."
curl -sSL https://install.astronomer.io | sudo bash

echo "Installing powerlevel9k..."
brew tap sambadevi/powerlevel9k
brew install powerlevel9k

while true; do
    read -p $'Do you need k8s packages?\n' yn
    case $yn in
        [Yy]* )
          echo "Installing data engineering packages..."
          brew install ${PACKAGES[@]}

          echo "Cleaning up..."
          brew cleanup

          echo "Installing eksctl..."
          brew tap weaveworks/tap
          brew install weaveworks/tap/eksctl
          brew upgrade eksctl && brew link --overwrite eksctl

          echo "Setup complete."
          break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
