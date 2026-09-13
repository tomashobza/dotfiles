export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

alias download=aria2c
# alias g++='/usr/bin/g++'
# alias g++='clang++'
# alias gcc='clang'

alias tpr="/Applications/Typora.app/Contents/MacOS/Typora"
alias typora="open -a tpr"

alias sed="gsed"

alias air='$(go env GOPATH)/bin/air'
# export PATH=$PATH:$(go env GOPATH)/bin

alias school='cd ~/school'
alias izp='cd ~/school/izp'

alias python='python3'

alias work='cd ~/code'

export PATH="$HOME/.npm-packages/bin:$PATH"
source /Users/tomashobza/.bash_profile

export PATH="/opt/bin:$PATH"

# export PATH="/Users/tomashobza/opt/GNAT/2020/bin:$PATH"
export PATH="/urs/bin:$PATH"

export PATH="/Users/tomashobza/opt/ghdl:$PATH"
export PATH="/Applications/gtkwave.app/Contents/Resources/bin/:$PATH"

export PYENV_ROOT="/Users/tomashobza/.pyenv"

# alias ghdl="ghdl_mcode"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lukerandall"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# pnpm
export PNPM_HOME="/Users/tomashobza/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

mkcd() {
  mkdir "$1"
  cd "$1"
}

sandbox() {
  local base=~/code/sandbox
  mkdir -p "$base"
  cd "$base" || return

  local default_name="experiment-$(date +%Y-%m-%d)"
  local name
  read "name?Folder name [$default_name]: "
  name="${name:-$default_name}"

  mkdir -p "$name"
  cd "$name" || return

  local init_git
  read "init_git?Initialize git repo? [Y/n]: "
  if [[ -z "$init_git" || "$init_git" =~ ^[Yy] ]]; then
    git init
  fi
}

# source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

source ~/perl5/perlbrew/etc/bashrc

# bun completions
[ -s "/Users/tomashobza/.bun/_bun" ] && source "/Users/tomashobza/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias vim=nvim
export PATH=$PATH:/Users/tomashobza/.spicetify

# alias ls=exa
# alias ll="exa -l"
alias ls=eza
alias ll="eza -l"

alias cat=bat

alias ssd="cd /Volumes/T7/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/tomashobza/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP binary.
export PATH="/Users/tomashobza/Library/Application Support/Herd/bin/":$PATH

eval $(thefuck --alias)

# Created by `pipx` on 2025-01-19 20:30:14
export PATH="$PATH:/Users/tomashobza/.local/bin"

# export LIBRARY_PATH="/opt/homebrew/Cellar/gcc/15.1.0/lib/gcc/15:$LIBRARY_PATH"

export PATH="/Users/tomashobza/.local/share/solana/install/active_release/bin:$PATH"
# Fix for dvisvgm/Manim with Homebrew TeXLive: ensure kpathsea sees full TEXMF tree
export TEXMFCNF="$(dirname "$(kpsewhich texmf.cnf)")"
export TEXMF="$(kpsewhich -var-value=TEXMF)"
export TEXMFDIST="$(kpsewhich -var-value=TEXMFDIST)"
export TEXMFLOCAL="$(kpsewhich -var-value=TEXMFLOCAL)"
export TEXMFVAR="$(kpsewhich -var-value=TEXMFVAR)"
export TEXMFSYSVAR="$(kpsewhich -var-value=TEXMFSYSVAR)"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

alias tuvpn='sudo openconnect --useragent="AnyConnect OpenConnect" --no-external-auth --user="e12534793@student.tuwien.ac.at" --authgroup="1_TU_getunnelt" vpn.tuwien.ac.at'

# Machine-local settings and secrets. Not tracked by git.
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
