# git
# https://github.com/romkatv/gitstatus#using-from-zsh
source $(brew --prefix)/opt/gitstatus/gitstatus.prompt.zsh
## https://github.com/romkatv/gitstatus/blob/master/gitstatus.prompt.zsh
PROMPT='%39F%$((-GITSTATUS_PROMPT_LEN-1))<…<%~%<<%f'  # blue current working directory
PROMPT+='${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT}'     # git status
PROMPT+=$'\n'                                         # new line
PROMPT+='%F{%(?.76.196)}%(#.#.$)%f '                  # $/# (normal/root); green/red (ok/error)

alias ibrew="arch -x86_64 /usr/local/bin/brew"
# macOS 12 Monterey or newer needs python alias
alias python="python3"

# function
source ~/.zsh_functions/ssh_colors.zsh
