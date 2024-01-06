export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
$HOME/.dotfiles/scripts/welcome.sh

ZSH_THEME="robbyrussell"
if [[ $TERM_PROGRAM == "WarpTerminal" ]]; then
	SPACESHIP_PROMPT_ASYNC=false
fi

plugins=(git zsh-autosuggestions z dotenv)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/spaceship/spaceship.zsh

export EDITOR='nvim'

# remap vim && vi
alias vim="nvim"
alias vi="nvim"
alias vimcfg="vim $HOME/.dotfiles/nvim/.config/nvim/init.lua"

# tmux helpers
alias tmf="$HOME/.dotfiles/scripts/tmux/tmux-nav" # find
alias tmk="tmux kill-session -t $1"           # kill
alias tms="tmux switch-client -t $1"          # switch
bindkey -s ^f "$HOME/.dotfiles/scripts/tmux/tmux-nav\n"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export M2_HOME="/Users/td/apache-maven-3.9.4"
PATH="${M2_HOME}/bin:${PATH}"
export PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
#
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

