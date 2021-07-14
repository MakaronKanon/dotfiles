# Set GPG_TTY so pinentry, invoked by GPG-Agent, launches in the correct TTY.
# $TTY is set by zsh.
export GPG_TTY=$TTY
#export DISPLAY=$DISPLAY
gpg-connect-agent updatestartuptty /bye >/dev/null
#echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1



# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export VISUAL=nvim
export EDITOR="$VISUAL"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:"/home/marcus/AppImages"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-z vi-mode fancy-ctrl-z)

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
alias nf="python3 ~/nf.py"
alias brave-debug="brave-browser --remote-debugging-port=9222"
alias vim="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias buds="bluetoothctl connect 18:4E:16:7C:25:D3"
alias lock="python3 ~/scripts/lock.py"


# . /usr/local/bin/virtualenvwrapper.sh

# nvm node manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nvm use node 1> /dev/null

# tab completetions for aws
# complete -C '/usr/local/bin/aws_completer' aws

# take current command line to vim
#bindkey -M vicmd "v" edit-command-line
#VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
#VI_MODE_SET_CURSOR=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Aliases.
alias dots="~/.dotfiles" # Go to dotfiles directory
alias copyp="copyq copy -" # Not sure, find out
# Change keyboards
alias aoeu="setxkbmap se -option ctrl:nocaps -option shift:both_capslock" # Change to normal qwerty
alias asdf="setxkbmap -I ~/.xkb vikingdvorak -option shift:both_capslock -option ctrl:nocaps -print | xkbcomp -I$HOME/.xkb - $DISPLAY" > /dev/null # Change to special dvorak

# Run all zsh files in .config/zsh/
eval $(thefuck --alias fuck)


