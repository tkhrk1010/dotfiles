
# Function to change terminal color based on SSH connection and reset it on exit
function color_ssh() {
    # Define colors similar to tmux's color schemes
    local color_original_fg="#FFFFFF"
    local color_original_bg="#001E00"
    local color_st_fg="#000000"
    local color_st_bg="#60D763"
    local color_prod_fg="#000000"
    local color_prod_bg="#B25157"

    # Determine color based on the first argument of the SSH command
    if [[ "$1" =~ "prod" ]]; then
        echo -ne "\033]10;${color_prod_fg}\007\033]11;${color_prod_bg}\007"
    else
        echo -ne "\033]10;${color_st_fg}\007\033]11;${color_st_bg}\007"
    fi

    # Set signal handler for SIGINT (Ctrl-C) and exit
    trap 'echo -ne "\033]10;${color_original_fg}\007\033]11;${color_original_bg}\007"' SIGINT EXIT

    # Execute SSH connection using 'command' to bypass the alias and store exit status
    command ssh "$@"
    local ssh_exit_status=$?

    # Reset color to original on exit
    echo -ne "\033]10;${color_original_fg}\007\033]11;${color_original_bg}\007"

    # Return the exit status of the ssh command
    return $ssh_exit_status
}

# change terminal background color when ssh in tmux
# https://bacchi.me/linux/change-terminal-bgcolor/
function tmux_color_ssh(){
    # save current pane id
    local pane_id=$(tmux display -p '#{pane_id}')

    # change background color
    if [[ `echo $1 | grep 'prod'` ]] ; then
        tmux select-pane -P 'bg=colour95,fg=black'
    else
        tmux select-pane -P 'bg=colour77,fg=black'
    fi

    trap 'tmux select-pane -t $pane_id -P "default"' SIGINT EXIT
    command ssh $@

    # back to default
    tmux select-pane -t $pane_id -P 'default'
}

# Function to change terminal or tmux pane color during SSH connection based on the environment
function custom_ssh() {
    if [[ -n $(printenv TMUX) ]]; then
      tmux_color_ssh "$@"
    else
      color_ssh "$@"
    fi
}

# Alias this combined function to `ssh` command
alias ssh='custom_ssh'
