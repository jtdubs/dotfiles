# Start nix-daemon
if ! pidof -q nix-daemon; then
    echo Starting nix-daemon
    sudo nohup `which nix-daemon` > /dev/null 2>&1 &
fi

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
antigen bundle git@github.com:spwhitt/nix-zsh-completions.git
antigen bundle git@github.com:chisui/zsh-nix-shell.git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Theme
# PROMPT='%F{6}%n%F{5}@%m%F{7}:%F{4}%2~%F{6}%(!.#.$) '
DEFAULT_USER=jtdubs
source ~/.zshtheme

# tmux
if (( $+commands[tmux] )); then
    if [ -z "$TMUX" ]; then
        if [ -n "$VSCODE_GIT_IPC_HANDLE" ]; then
            TMUX_SESSION=vscode
        else
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
