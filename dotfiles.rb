PATH = File.expand_path '~/.dotfiles'

dep 'dotfiles', :install_ssh_socket_hack do
  requires 'dotfiles-installed'
  requires 'dotfiles-configured'.with(install_ssh_socket_hack)
end

dep 'dotfiles-installed' do
  met? { File.exists?(PATH) }
  meet { git 'git@github.com:reentim/.dotfiles.git', :to => PATH }
end

dep 'dotfiles-configured', :install_ssh_socket_hack do
  install_ssh_socket_hack.default! false

  requires 'dotfiles-installed'
  # requires 'italic-terminal'

  met? { '~/.aliases'.p.exists? }
  met? { '~/.vim'.p.exists? }
  met? { '~/.vim/bundle/command-t'.p.exists? }

  meet {
    system %Q{
      cd #{PATH}
      rake install
      git submodule update --init --recursive
    }

    if install_ssh_socket_hack.set?
      system %Q{
        cd #{PATH}
        rake ssh
      }
    end

  }
end
