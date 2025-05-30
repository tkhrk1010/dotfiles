# git
# https://github.com/romkatv/gitstatus#using-from-zsh
source $(brew --prefix)/opt/gitstatus/gitstatus.prompt.zsh
## https://github.com/romkatv/gitstatus/blob/master/gitstatus.prompt.zsh
PROMPT='%39F%$((-GITSTATUS_PROMPT_LEN-1))<…<%~%<<%f'  # blue current working directory
PROMPT+='${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT}'     # git status
PROMPT+=$'\n'                                         # new line
PROMPT+='%F{%(?.76.196)}%(#.#.$)%f '                  # $/# (normal/root); green/red (ok/error)

# macOS 12 Monterey or newer needs python alias
alias python="python3"

# function
source ~/.zsh_functions/ssh_colors.zsh

# Override default macOS path with Homebrew's path when both exist (e.g., Python).
export PATH="/opt/homebrew/bin:$PATH"

# for rbenv
eval "$(rbenv init - zsh)"
