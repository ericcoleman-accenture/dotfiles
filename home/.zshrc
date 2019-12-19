unsetopt beep
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -z edit-command-line
zle -N edit-command-line

# this needs to happen before prompt system init
export fpath=( "$HOME/.zfunctions" "$HOME/.zsh/completion" $fpath )

# turn on completion system
autoload -Uz compinit && compinit
# turn on prompt system
autoload -U promptinit && promptinit
prompt pure
# prompt char is green normally and red after a failed command
PROMPT=%(?.%F{green}.%F{red})${PURE_PROMPT_SYMBOL:-❯ }%f

# history settings
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed


# use vi style line editor
bindkey -v
# use jk to get to 'normal mode'
bindkey -M viins 'jk' vi-cmd-mode

bindkey -M vicmd 'V' edit-command-line
# bind ^R to search for when you forget about vi mode
bindkey '^R' history-incremental-search-backward
bindkey '^N' insert-last-word
bindkey '^J' down-history
bindkey '^K' up-history
bindkey '^E' vi-end-of-line
bindkey '^A' vi-beginning-of-line

# fixes weird delete behavior, probably osx/macbook specific?
# https://superuser.com/questions/997593/why-does-zsh-insert-a-when-i-press-the-delete-key
bindkey "^[[3~" delete-char

function tk {
    local session="$1"
    if [[ ! -z "$session" ]]; then
        # this is zsh read syntax - will have to adjust to use for bash
        read "response?Kill session: $session [Y/n]? "
        response=${response}
        if [[ $response =~ ^(yes|y|Y| ) ]] | [ -z $response ]; then
            tmux kill-session -t "$session"
        fi
    fi
}

[ -f $HOME/.fzf.zsh ] && \
    source $HOME/.fzf.zsh

alias sbrc='source ~/.zshrc'

[ -f ~/.config/exercism/exercism_completion.zsh ] && \
    source ~/.config/exercism/exercism_completion.zsh

[ -f $HOME/.asdf/asdf.sh ] && \
    source $HOME/.asdf/asdf.sh

[ -f $HOME/.asdf/completions/asdf.bash ] && \
    source $HOME/.asdf/completions/asdf.bash

[ -f ~/.fzf.zsh ] && \
    source ~/.fzf.zsh

command_not_found_handler() {
    figlet "lol, ${@}"
}

#
# source this blindly because i want it to error if it's not there
source ~/.common-shell-profile
export PATH=${PATH}:$HOME/.cargo/bin
