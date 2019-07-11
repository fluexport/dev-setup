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


4. [awscli](https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html): aws command line interface.

  ```bash
  $ pip install --upgrade awscli
  ```
  Run the below commands to enable autocomplete.

  ```bash
  $ which aws_zsh_completer.sh
  /Users/flu/.pyenv/shims/aws_zsh_completer.sh
  $ echo "source $PYENV_ROOT/versions/3.7.2/bin/aws_zsh_completer.sh"
  ```

5. [DB Tools]()
  - [DataGrip](https://www.jetbrains.com/datagrip/)
  ```bash
  brew cask install datagrip
  ```
