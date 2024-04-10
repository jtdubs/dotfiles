# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Auto-complete
zstyle :compinstall filename '/home/jtdubs/.zshrc'
autoload -Uz compinit
compinit

# Aliases
alias x=exit
alias vi=nvim
alias vim=nvim
alias enter='nix-shell . --command zsh'
alias blaze=bazel
alias t='tmux new-session -A -s'
alias code='/usr/share/code/code --enable-ozone --ozone-platform=wayland'

# Path
export PATH=$PATH:~/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/opt/neovim/bin

# Editor
export EDITOR=nvim

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install antigen
if [ ! -f ~/.zsh/antigen.zsh ]; then
    mkdir -p ~/.zsh
    curl -L git.io/antigen > ~/.zsh/antigen.zsh
fi
source ~/.zsh/antigen.zsh

# Plugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle dotenv
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle jeffreytse/zsh-vi-mode
antigen apply

# Starship
eval "$(starship init zsh)"

# Risc-V Toolchain
export PATH=$PATH:/opt/riscv32/bin

# # Verilator
# export PATH=$PATH:$HOME/dev/verilator/bin
# export VERILATOR_ROOT=$HOME/dev/verilator

# GHC
[ -f "/home/jtdubs/.ghcup/env" ] && source "/home/jtdubs/.ghcup/env" # ghcup-env

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"

# Yosys and Synlig
export PATH=$PATH:$HOME/dev/synlig/out/current/bin

# Vivado Studio
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontsettings=on -Dswing.aatext=true"

# Plz
source <(plz --completion_script)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Disable history sharing
unsetopt share_history

# tmux
if  [[ "$TERM_PROGRAM" != "vscode" ]] && \
    [[ "$TERM_PROGRAM" != "tmux"   ]] && \
    [[ "$VSCODE_RESOLVING_ENVIRONMENT" -ne 1 ]] && \
    [[ "$UID" -ne 0 ]] && \
    (( $+commands[tmux] )) then

    TMUX_SESSION=$VSCODE_PROJECT
    if [ -z "$TMUX_SESSION" ]; then
        TMUX_SESSION=default
    fi
    tmux new-session -A -s $TMUX_SESSION
fi
