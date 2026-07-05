# yt-dlp needs browser cookies to pass YouTube's bot check (terminal needs Full Disk Access)
export SUMMARIZE_YT_DLP_COOKIES_FROM_BROWSER=chrome

[[ $- == *i* ]] || return

# --- history ---
mkdir -p ~/bash_history
__sess=~/bash_history/$(hostname -s).$$
HISTFILE=~/bash_history/$(hostname -s).hist
HISTSIZE=10000
HISTFILESIZE=
HISTTIMEFORMAT='%F %T '

shopt -s histappend

# rich per-session log: timestamp <TAB> cwd <TAB> command
log_cmd() {
  local HISTTIMEFORMAT= n cmd ts
  read -r n cmd <<<"$(history 1)"
  [[ $n == "$__last_hist_n" ]] && return
  __last_hist_n=$n
  printf -v ts '%(%F %T)T' -1
  printf '%s\t%s\t%s\n' "$ts" "$PWD" "$cmd" >>"$__sess.tsv"
}

# --- shell options ---
shopt -s extglob globstar checkjobs

eval "$(/opt/homebrew/bin/brew shellenv bash)"
eval "$(direnv hook bash)"
eval "$(zoxide init bash --cmd j)"
eval "$(fzf --bash)"

PROMPT_COMMAND+=('history -a; history -n' log_cmd)

alias vim=nvim
alias svim='sudo --preserve-env=HOME nvim'
alias codex='codex --yolo'

alias ll="ls -lah"
alias sts='aws sts get-caller-identity'
alias today='date -u +%Y-%m-%d'
alias ga='git commit -a'

[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] &&
  . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

PS1='$(ret=$?; if [[ $ret -ne 0 ]]; then printf "\[\e[31m\]"; fi)\W \$ \[\e[0m\]'

h() {
  rg -a -g '*.tsv' "$@" ~/bash_history/
}

export PATH="$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$PATH"
