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

# Path
export PATH=$PATH:~/.cargo/bin:~/bin:~/.local/bin:~/go/bin:/usr/local/go/bin

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
antigen apply

# Starship
eval "$(starship init zsh)"

# Risc-V Toolchain
export PATH=$PATH:/opt/riscv32/bin

# Verilator
export PATH=$PATH:$HOME/dev/verilator/bin
export VERILATOR_ROOT=$HOME/dev/verilator

# Vivado
export PATH=$PATH:/opt/Xilinx/Vivado/2022.2/bin

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Disable history sharing
unsetopt share_history

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"

# tmux
if [[ "$TERM_PROGRAM" != "vscode" ]] && [[ "$TERM_PROGRAM" != "tmux" ]] && [[ "$UID" -ne 0 ]] && (( $+commands[tmux] )) then
    TMUX_SESSION=$VSCODE_PROJECT
    if [ -z "$TMUX_SESSION" ]; then
        TMUX_SESSION=default
    fi
    exec tmux new-session -A -s $TMUX_SESSION
fi
