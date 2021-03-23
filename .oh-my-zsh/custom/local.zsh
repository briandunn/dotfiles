export PATH=~/.bin:~/Library/Python/3.8/bin:$PATH
export RUBY_EXTRA_CONFIGURE_OPTIONS="--enable-shared --install-doc"
[ -z "${TMUX}" ] || export NVIM_LISTEN_ADDRESS="${TMPDIR}nvim-"`tmux display -p '#{session_id}#{window_id}' | tr $ s`
# source $(brew --prefix asdf)/asdf.sh
# hard coding because ^ is too slow
source /usr/local/opt/asdf/asdf.sh
alias vim="nvim --listen ${NVIM_LISTEN_ADDRESS:-/tmp/nvimsocket}"
alias be='bundle exec'

# git
alias gap='git add --patch'
alias gd='git diff'
alias gdc='git diff --cached'
alias gpr='git pull --rebase'
alias gra='git rebase --abort'
