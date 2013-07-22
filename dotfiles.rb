PATH = File.expand_path '~/.dotfiles'

dep 'dotfiles' do
  requires 'dotfiles installed'
  requires 'dotfiles configured'
end

dep 'dotfiles installed' do
  met? { File.exists?(PATH) }
  meet { git 'https://github.com/reentim/.dotfiles.git', to: PATH }
end

dep 'dotfiles configured' do
  requires 'dotfiles installed'

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
