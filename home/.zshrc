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

# Path
export PATH=$PATH:~/.cargo/bin:~/bin:/usr/local/go/bin:~/go/bin

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
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Starship
eval "$(starship init zsh)"

# tmux
if [[ x"$VSCODE_CWD" == x"" ]] then
    if [ "$UID" -ne 0 ]; then
        if (( $+commands[tmux] )); then
            if [ -z "$TMUX" ]; then
                TMUX_SESSION=$VSCODE_PROJECT
                if [ -z "$TMUX_SESSION" ]; then
                    TMUX_SESSION=default
                fi
                if tmux has-session -t $TMUX_SESSION >/dev/null 2>&1; then
                    exec tmux attach -t $TMUX_SESSION
                else
                    exec tmux new-session -s $TMUX_SESSION
                fi
            else
                echo
            fi
        fi
    fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
