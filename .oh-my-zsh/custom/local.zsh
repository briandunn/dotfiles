export PATH=~/.bin:~/Library/Python/3.8/bin:$PATH
export RUBY_EXTRA_CONFIGURE_OPTIONS="--enable-shared --install-doc"
if [ -z "${TMUX}" ]; then
  export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
else
  export NVIM_LISTEN_ADDRESS="${TMPDIR}nvim-"`tmux display -p '#{session_id}#{window_id}' | tr $ s`
fi
# source $(brew --prefix asdf)/asdf.sh
# hard coding because ^ is too slow
source /usr/local/opt/asdf/asdf.sh
export EDITOR='nvr -s'
alias vim="nvim --listen ${NVIM_LISTEN_ADDRESS:-/tmp/nvimsocket}"
alias be='bundle exec'
alias cat=bat

# git
alias gap='git add --patch'
alias gd='git diff'
alias gdc='git diff --cached'
alias gpr='git pull --rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
