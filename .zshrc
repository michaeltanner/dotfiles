# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="darkwind" # "clean" is also a good one

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew colored-man tmux tmuxinator vi-mode vundle virtualenv)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X10/bin:/usr/texbin"
export PATH="$HOME/bin:$PATH"
export PATH="/Developer/NVIDIA/CUDA-6.5/bin:$PATH"
export LAPS_BIN="$HOME/code/laps/build/bin/"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
export VISUAL=$EDITOR

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias l="ls -GFh"
alias ls="ls -GFh"
alias la="ls -GFha"
alias ll="ls -GFhl"
alias lla="ls -GFhla"
alias bi="brew install"

alias gd="git diff --word-diff"
alias gcd="git checkout develop"
alias gg="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

alias m="make"
alias mt="make && make test"
alias ta="tmux a"
alias tl="tmux ls"
alias tms="tmuxinator start"
alias tmn="tmuxinator new"

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

# Plugin for Tmux
source ~/.bin/tmuxinator.zsh
export DISABLE_AUTO_TITLE=true

# MRG SSH Settings
SSH_ENV="$HOME/.ssh/environment"

start_agent() {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

bash .motd