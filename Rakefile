# frozen_string_literal: true

require 'pathname'

force = ENV['FORCE']
task :link do
  files = %w[
    .tmux.conf
    .config
    .oh-my-zsh/custom
    .gitconfig
    Library/KeyBindings/DefaultKeyBinding.dict
  ]

  dotfiles = `git ls-files #{files.join ' '}`.each_line.map do |line|
    Pathname(line.strip)
  end

  dotfiles.each do |dotfile|
    dir = Pathname(Dir.home).join(dotfile.dirname)
    mkdir_p(dir, verbose: true) unless dir.exist?
    ln_s(
      dotfile.expand_path,
      dir.join(dotfile.basename).expand_path,
      force: force,
      verbose: true
    )
  rescue StandardError => e
    warn(e)
  end
end

task :brew do
  formulae = %w[
    asdf
    bat
    gh
    git
    gpg
    jq
    nvim
    rectangle
    rg
    tmux
    tree
  ]

  formulae.each do |formula|
    sh 'brew', 'install', formula
  end
end

def install_latest(plugin)
  sh 'asdf', 'install', plugin, 'latest'
  version = `asdf list #{plugin}`.strip
  sh 'asdf', 'global', plugin, version
end

def install_asdf_plugin(name)
  sh 'asdf', 'plugin', 'add', name
rescue StandardError => e
  warn(e)
end

task 'install-node' do
  install_asdf_plugin 'nodejs'
  sh '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
  install_latest 'nodejs'
end

task 'install-ruby' do
  install_asdf_plugin 'ruby'
  install_latest 'ruby'
end

task 'install-gems': 'install-ruby' do
  %w[solargraph tmuxinator pry bundler].each do |gem|
    sh 'gem', 'install', gem
  end
end

task coc: %i[install-node install-gems] do
  sh 'npm', 'install', '--global', 'yarn'

  cd Pathname(__dir__).join('.config/coc/extensions').to_s do
    sh 'yarn'
  end
end

task default: :link
