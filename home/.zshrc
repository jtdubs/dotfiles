if ! pidof -q nix-daemon; then
    echo Starting nix-daemon
    sudo nohup `which nix-daemon` > /dev/null 2>&1 &
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '/home/jtdubs/.zshrc'
autoload -Uz compinit
compinit

PROMPT='%F{6}%n%F{5}@%m%F{7}:%F{4}%2~%F{6}%(!.#.$) '

# Aliases
alias x=exit
alias vi=nvim
alias vim=nvim

# Install antigen
if [ ! -f ~/.zsh/antigen.zsh ]; then
	mkdir -p ~/.zsh
	curl -L git.io/antigen > ~/.zsh/antigen.zsh
fi
source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
