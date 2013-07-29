PATH = File.expand_path '~/.dotfiles'

dep 'dotfiles' do
  requires 'dotfiles installed'
  requires 'dotfiles configured'
end

dep 'dotfiles installed' do
  met? { File.exists?(PATH) }
  meet { git 'git@github.com:reentim/.dotfiles.git', to: PATH }
end

dep 'dotfiles configured' do
  requires 'dotfiles installed'
  requires 'italic terminal'

  met? { '~/.aliases'.p.exists? }
  met? { '~/.vim'.p.exists? }
  met? { '~/.ssh/rc'.p.exists? }
  meet {
    system %Q{
      cd #{PATH}
      rake install
      rake ssh
      git submodule init
      git submodule update
    }
  }
end

dep 'italic terminal' do
  available_terminals = `toe`
  met? {
    available_terminals.include? 'xterm-256color-italic'
  }
  meet { `tic ~/.dotfiles/terminals/xterm-256color-italic.terminfo` }
end
