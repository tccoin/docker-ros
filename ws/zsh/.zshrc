# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git cp z cp extract history colorize command-not-found sudo zsh-autosuggestions zsh-syntax-highlighting)

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user anaconda dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(nvm pyenv time)
POWERLEVEL9K_DISABLE_GITSTATUS=true

source $ZSH/oh-my-zsh.sh

# User configuration

export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias pc='proxychains'
alias tilix='LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 tilix'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup=`"$HOME/miniconda/bin/conda" 'shell.bash' 'hook' 2> /dev/null`
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/ros/noetic/setup.zsh
# source /root/build/mynt-eye-d-sdk/wrappers/ros/devel/setup.zsh
source /root/catkin_ws/devel/setup.zsh
export PYTHONPATH="/root/ws/autoaim/:$PYTHONPATH"
