require 'pathname'

force = ENV['FORCE']
task :default do
  dotfiles = `git ls-files .tmux.conf .config`.each_line.map do |line|
    Pathname(line.strip)
  end

  pp dotfiles
  dotfiles.each do |dotfile|
    dir = Pathname(Dir.home).join(dotfile.dirname)
    mkdir_p(dir, verbose: true) unless dir.exist?
    ln_s(dotfile.expand_path, dir.join(dotfile.basename).expand_path, force: force, verbose: true)
  end
end
