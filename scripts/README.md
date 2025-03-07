[Python Environment](https://www.python.org/)
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

  Don't contaminate your **global** *Python* install. The following example installs 4 **special** *virtualenvs* for **data science**/ **data analytics** use case.

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
  2.7.16/envs/ipython2 (created from /Users/YOUR_USERNAME/.pyenv/versions/2.7.16)
  2.7.16/envs/tools2 (created from /Users/YOUR_USERNAME/.pyenv/versions/2.7.16)
  3.7.2/envs/jupyter3 (created from /Users/YOUR_USERNAME/.pyenv/versions/3.7.2)
  3.7.2/envs/tools3 (created from /Users/YOUR_USERNAME/.pyenv/versions/3.7.2)
  * ipython2 (created from /Users/YOUR_USERNAME/.pyenv/versions/2.7.16)
  * jupyter3 (created from /Users/YOUR_USERNAME/.pyenv/versions/3.7.2)
  * tools2 (created from /Users/YOUR_USERNAME/.pyenv/versions/2.7.16)
  * tools3 (created from /Users/YOUR_USERNAME/.pyenv/versions/3.7.2)
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
  $ echo 'pyenv virtualenvwrapper_lazy' >> ~/.zshrc
  # refresh the shell to take effect
  $ exec $SHELL
  ```

  Example of how to link an existing cloned project.
  ```bash
  $ mkvirtualenv -a ~/workspace/bi-etl -p python2 bi-etl
  # sanity check
  $ lsvirtualenv
  bi-etl
  ======

  ```
  This creates a `bi-etl` *virtualenv* in `~/.virtualenvs`. You can switch to it by running `workon bi-etl`. You can turn it off by running `deactivate`. Add the `virtualenv` plugin to show the prompt change.

  Check out [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html) for more commands.

- **TL;DR**
  ```bash
  $ brew install pyenv
  $ pyenv install 2.7.16
  $ pyenv global 2.7.16
  $ brew install pyenv-virtualenvwrapper
  ```
  In your `.bash_profile` or `.zshrc` it should have
  ```bash
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  export WORKON_HOME=~/.virtualenv
  export PROJECT_HOME=~/workspace
  pyenv virtualenvwrapper_lazy
  ```
