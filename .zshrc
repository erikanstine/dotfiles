#    _______ _______ _______ _______
#   |\     /|\     /|\     /|\     /|
#   | +---+ | +---+ | +---+ | +---+ |
#   | |   | | |   | | |   | | |   | |
#   | |P  | | |A  | | |T  | | |H  | |
#   | +---+ | +---+ | +---+ | +---+ |
#   |/_____\|/_____\|/_____\|/_____\|

export PATH=~/bin:$PATH
export PATH=$PATH:/Users/eanstine/bin
export PATH=$PATH:/Users/eanstine/Library/Python/3.7/bin
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/Cellar
export PATH=$PATH:/Users/eanstine/go/bin
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export GOPATH=/Users/eanstine/go
export GO111MODULE=on #go get -u golang.org/x/tools/cmd/goimports
export GOPROXY=https://proxy.golang.org
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias brew86="arch -x86_64 /usr/local/bin/brew"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# aliases
alias soz="source ~/.zshrc"
alias t="task"
alias brew86="arch -x86_64 /usr/local/bin/brew"

# functions
function preman() { man -t "$@" | open -f -a "Preview" ;}

# Create PR using FIDEVX template
function gh-pr {
        gh pr create --draft -F $PLAID_PATH/pr-template.md
}

# OVERWRITE local dotfiles
function saveDot() {
    echo "Updating $HOME/$1"
    cat ~/code/dotfiles/$1 > ~/$1
    echo "Reloading shell"
    soz
}

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
