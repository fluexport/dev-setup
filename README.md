# Dev Setup
This is a comprehensive walkthrough of my personal dev setup. Feel free to use it for onboarding. I'll be updating this every once in a while. Adding in a shell script/ Makefile in the near future. Given that this is public, I will be putting access-sensitive material somewhere else.

## Dev Toolkits
1. [brew](https://brew.sh/)

  ```bash
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

2. [Python Environment](https://www.python.org/)

  ![Python Environment](/assets/img/python_environment_2x.png)

  As you can see, there's no right way to do a proper python dev setup.🤷‍

  🌟 This is my **best attempt** to have a squeaky clean/ bare minimum python dev environment for data-specific roles. 🤷‍

  1. I use *pyenv* to install Python interpreters.

  2. I use *pyenv-virtualenv* to configure my "global" environment.

  3. I use *pyenv-virtualenvwrapper* to work on projects.

  Simply run
  ```setup
  $ sh setup/pyenv_setup.sh
  ```
  If you want a more in-depth explanations, read [here](setup/README.md).

3. [git](https://github.com/flexport/flexport)
  - [Generate a new ssh key.](https://help.github.com/en/enterprise/2.15/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    ```bash
    # generate public/private key pair
    $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    # start ssh-agent
    $ eval "$(ssh-agent -s)"
    ```
    Automatically load keys into the ssh-agent and store passphrases in your keychain by modifying your `~/.ssh/config`.
    ```
    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_rsa
    ```
    Add your SSH private key to the ssh-agent and store your passphrase in the keychain
    ```bash
    $ ssh-add -K ~/.ssh/id_rsa
    ```

  - [Add a new ssh key.](https://help.github.com/en/enterprise/2.15/user/articles/adding-a-new-ssh-key-to-your-github-account)
    ```bash
    # Copies the contents of the id_rsa.pub file to your clipboard
    $ pbcopy < ~/.ssh/id_rsa.pub
    ```

## Editor/ Terminal
See [cli](cli/README.md).

## Data Eng Specific
See [data-eng](data-eng/README.md)

## Productivity Tools
1. [Spectacle](https://www.spectacleapp.com/): Window snapping/ reshaping tool.

2. [Authy](https://authy.com/download/): Desktop app for 2FA.

3. [Pulse](https://messenger.klinkerapps.com/overview/platform-windows.html): iMessage for Android.

4. [Alfred](https://www.alfredapp.com/): Spotlight-like Productivity app.

5. [1Password](https://1password.com/): password management tool.

6. [AppCleaner](https://freemacsoft.net/appcleaner/): App Cleaning tool.

7. [Postman](https://www.getpostman.com/): API dev environment.

  ```bash
  $ brew cask install postman
  ```
