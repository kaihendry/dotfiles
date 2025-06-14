test "$(uname -s)" == "Darwin" && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f ~/.bashrc ]] && . ~/.bashrc
