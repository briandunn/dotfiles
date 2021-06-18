export PATH=~/.bin:~/Library/Python/3.8/bin:~/Library/Android/sdk/tools/bin:$PATH
export RUBY_EXTRA_CONFIGURE_OPTIONS="--enable-shared --install-doc"
if [ -z "${TMUX}" ]; then
  export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
else
  export NVIM_LISTEN_ADDRESS="${TMPDIR}nvim-"`tmux display -p '#{session_id}#{window_id}' | tr $ s`
fi
# source $(brew --prefix asdf)/asdf.sh
# hard coding because ^ is too slow
source /opt/homebrew/opt/asdf/asdf.sh
export EDITOR='nvr -s'
alias vim="nvim --listen ${NVIM_LISTEN_ADDRESS:-/tmp/nvimsocket}"
alias be='bundle exec'
alias cat=bat
alias iex="ERL_AFLAGS='-kernel shell_history enabled' iex"

# git
alias gap='git add --patch'
alias gc="git commit"
alias gd='git diff'
alias gdc='git diff --cached'
alias gpr='git pull --rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'

# opam configuration
test -r /Users/brian/.opam/opam-init/init.zsh && . /Users/brian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
