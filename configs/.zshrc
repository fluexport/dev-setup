# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/flu/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm last-working-dir)

# more plugins and themes
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/p9k.sh
source $ZSH/ttc.sh
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# pyenv
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
alias git-visualize='git log --graph --decorate --oneline'
alias ohmyzsh="atom ~/.oh-my-zsh"
alias p9kconfig="atom $ZSH/p9k.sh"
alias ttc="tiny-care-terminal"
alias zshconfig="atom ~/.zshrc"
alias zshenvconfig='atom ~/.zshenv'

# postgres
alias pg-start="launchctl load ~/Library/LaunchAgents"
alias pg-stop="launchctl unload ~/Library/LaunchAgents"
alias pg-status="pg_ctl status -D /usr/local/var/postgres/"

# databases
alias bi-master='psql -h bi-master.flxt-data.com -U bi_etl_user -d flexport_bi'
alias bi-slave='psql -h bi-reporting.flxt-data.com -U bi_etl_user -d flexport_bi'
alias bi-api='psql -h bi-reporting.flxt-data.com -U prediction_service -d flexport_bi'
alias doc-ex='psql -h document-extraction.flxt-data.com -p 5432 -d document_extraction -U document_extraction_user'
alias core-slave='psql -h core-etl.flxt-data.com  -U periscope -d flexport_production'
alias redshift='psql -h redshift.flxt-data.com -p 5439 -d datawarehouse -U bi_etl_user'
alias airflowdb='psql -h airflow.flxt-data.com -p 5432 -d postgres -U postgres'
alias boomi-master='psql -h boomi-master.flxt-data.com -p 5432 -d boomi_prod -U bi_etl_user'
alias boomi-reporting='psql -h boomi-master.flxt-data.com -p 5432 -d boomi_prod -U bi_report_user'
alias buildkite='psql -h buildkite-data-eng.flxt-data.com -p 5432 -d data_eng -U bi_etl_user'

# kubernetes
source <(kubectl completion zsh)
[ -f /Users/flu/.oh-my-zsh/.kubectl_aliases ] && source /Users/flu/.oh-my-zsh/.kubectl_aliases

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# aws-cli
source $PYENV_ROOT/versions/3.7.2/bin/aws_zsh_completer.sh
