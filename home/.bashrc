function tk {
local session="$1"
if [[ ! -z "$session" ]]; then
    read -r -p "Kill session: ${session}? [Y/n]" response
    response=${response,,}    # tolower
    if [[ $response =~ ^(yes|y|Y| ) ]] | [[ -z $response ]]; then
        tmux kill-session -t "$session"
    fi
fi
                                                            }
#shopt -s globstar
#shopt -s nullglob
#shopt -s extglob

alias sbrc="source ~/.bashrc"

# source this blindly because i want it to error if it's not there
source ~/.common-shell-profile

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
