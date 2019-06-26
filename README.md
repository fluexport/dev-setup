# Dev Setup
This is a comprehensive walkthrough of my personal dev setup. Feel free to use it for onboarding. I'll be updating this every once in a while. Adding in a shell script/ Makefile in the near future. Given that this is public, I will be putting access-sensitive material somewhere else.

## Dev Toolkits
1. [brew](https://brew.sh/)

  ```bash
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

2. [Python Environment](https://www.python.org/)

  ![Python Environment](/assets/img/python_environment_2x.png)

  As you can see, there's no right way to do a proper python dev setup.

  🤷 This is my **best attempt** to have a squeaky clean/ bare minimum python dev environment for data-specific roles.🤷‍

  1. I use *pyenv* to install Python interpreters.

  2. I use *pyenv-virtualenv* to configure my "global" environment.

  3. I use *pyenv-virtualenvwrapper* to work on projects.

  - [pyenv](https://github.com/pyenv/pyenv)

    ```bash
    $ brew install pyenv
    $ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshenv
    $ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshenv
    # enable shims and autocompletion.
    $ echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    # temporary getaround with brew https://github.com/pyenv/pyenv/issues/106
    $ echo 'alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"' >> ~/.zshrc
    # install python 2.7.16
    $ pyenv install 2.7.16
    # install python 3.7.2
    $ pyenv install 3.7.2
    ```
    Check out other [pyenv commands](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md).

  - [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

    Don't contaminate your **global** *Python* install. The following example installs 4 **special** *virtualenvs* for **data science/ data analytics** use case.

    ```bash
    $ brew install pyenv-virtualenv
    # create your virtualenvs    
    $ pyenv virtualenv 3.7.2 jupyter3
    $ pyenv virtualenv 3.7.2 tools3
    $ pyenv virtualenv 2.7.16 ipython2
    $ pyenv virtualenv 2.7.16 tools2
    ```

    - `jupyter3` allows a single *Jupyter* install to create notebooks for *Python2*, *Python3*, *R*, *Bash* and many other languages.

      ```bash
      $ pyenv activate jupyter3
      $ pip install jupyter
      $ python -m ipykernel install --user
      $ pyenv deactivate
      ```

    - `ipython2` contains *iPython* and the *Kernel*.

      ```bash
      $ pyenv activate ipython2
      $ pip install ipykernel
      $ python -m ipykernel install --user
      $ pyenv deactivate
      ```
    - `tools3` has tools that runs in *Python3* and not *Python2*.

      ```bash
      $ pyenv activate tools3
      $ pip install PYTHON3_PACKAGES
      $ pyenv deactivate
      ```

    - `tools2` has tools that runs in *Python2* and not *Python3*.

      ```bash
      $ pyenv activate tools2
      $ pip install PYTHON2_PACAKGES
      $ pyenv deactivate
      ```

    This last step sets the priorities for *Python* versions and the *virtualenvs* to work with each other.

    ```bash
    # set global python versions
    $ pyenv global 3.7.2 2.7.16 jupyter3 ipython2 tools3 tools2
    ```

    Some sanity checks.
    ```bash
    $ pyenv versions
    system
    * 2.7.16 (set by /Users/YOUR_USERNAME/.pyenv/version)
    2.7.16/envs/ipython2
    2.7.16/envs/tools2
    * 3.7.2 (set by /Users/YOUR_USERNAME/.pyenv/version)
    3.7.2/envs/jupyter3
    3.7.2/envs/tools3
    * ipython2 (set by /Users/YOUR_USERNAME/.pyenv/version)
    * jupyter3 (set by /Users/YOUR_USERNAME/.pyenv/version)
    * tools2 (set by /Users/YOUR_USERNAME/.pyenv/version)
    * tools3 (set by /Users/YOUR_USERNAME/.pyenv/version)

    $ pyenv virtualenvs
    2.7.16/envs/ipython2 (created from /Users/flu/.pyenv/versions/2.7.16)
    2.7.16/envs/tools2 (created from /Users/flu/.pyenv/versions/2.7.16)
    3.7.2/envs/jupyter3 (created from /Users/flu/.pyenv/versions/3.7.2)
    3.7.2/envs/tools3 (created from /Users/flu/.pyenv/versions/3.7.2)
    * ipython2 (created from /Users/flu/.pyenv/versions/2.7.16)
    * jupyter3 (created from /Users/flu/.pyenv/versions/3.7.2)
    * tools2 (created from /Users/flu/.pyenv/versions/2.7.16)
    * tools3 (created from /Users/flu/.pyenv/versions/3.7.2)
    ```
    Check out [virtualenv](https://github.com/pyenv/pyenv-virtualenv#usage) for more commands.

  - [pyenv-virtualenvwrapper](https://github.com/pyenv/pyenv-virtualenvwrapper)

    ```bash
    $ brew install pyenv-virtualenvwrapper
    # All virtual envs live here
    $ mkdir ~/.virtualenvs
    # All projects live here
    $ mkdir ~/workspace
    $ echo 'export WORKON_HOME=~/.virtualenvs' >> ~/.zshenv
    $ echo 'export PROJECT_HOME=~/workspace' >> ~/.zshenv
    ```

    Example of how to link an existing cloned project.
    ```bash
    $ mkvirtualenv -a ~/workspace/bi-etl -p python2 bi-etl
    ```
    This creates a bi-etl virtualenv in `~/.virtualenvs` and you can switch to it by running `workon bi-etl`.

    Check out [virtualenvwrapper](https://github.com/pyenv/pyenv-virtualenvwrapper#usage) for more commands.

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

## Data Specific
1. [Airflow](https://github.com/flexport/bi-etl): Flexport's bi-etl.

2. [Dagster](https://github.com/dagster-io/dagster): WIP. Playing around with it atm.

3. [Kubernetes](https://kubernetes.io/): Container orchestration tool.

  - [Docker](https://docs.docker.com/docker-for-mac/install/): container platform.

  - [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

    ```bash
    $ brew install kubernetes-cli
    # sanity check
    $ kubectl version
    # enable auto-completion
    $ echo "source <(kubectl completion zsh)" >> ~/.zshrc
    ```

  - [kubectl aliases](https://github.com/ahmetb/kubectl-aliases)
    ```bash
    $ curl -o $ZSH/.kubectl_aliases https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
    $ echo "[ -f $ZSH/.kubectl_aliases ] && source $ZSH/.kubectl_aliases" >> ~/.zshrc
    ```


3. [awscli](https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html): aws command line interface.

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
