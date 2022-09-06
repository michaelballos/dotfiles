# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export DOTFILES=$HOME/dotfiles
export ZSH="$HOME/.oh-my-zsh" # path to oh-my-zsh

# aliases
alias h="cd $HOME"
alias vimlua="cd $DOTFILES/.config/nvim"
alias v="nvim"
alias lg="lazygit"
alias zc="cd $HOME/dev/zetocam"
alias cp="cd $HOME/dev/camip"
alias lj="cd $HOME/dev/particleSpace/leasey-jp"

# source some extra files
source $ZSH/oh-my-zsh.sh
source $DOTFILES/shell/antigen.zsh 

plugins=(
  git
  aliases
)
# antigen terminal stuff
antigen use oh-my-zsh 
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle z

# antigen node stuff
antigen bundle node
antigen bundle npm
antigen bundle git

# do OS dependant stuff
case `uname` in
  Darwin)
    # commands for OS X go here
    antigen bundle osx
  ;;
  Linux)
    # commands for Linux go here
  ;;
esac

# set the theme
antigen theme fino-time
# apply the Antigen stuff
antigen apply

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
