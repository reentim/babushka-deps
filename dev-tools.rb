dep 'dev-tools' do
  requires {
    on :linux, %w[
      ack-grep.managed
      tmux.managed
      zsh.managed
      silversearcher-ag.managed
    ]

    on :osx, %w[
      homebrew
      homebrew-packages
      vagrant.installer
      zsh.managed
    ]
  }

  requires 'gems'
  requires 'tree.managed'
end

dep 'tree.managed'
dep 'silversearcher-ag.managed' do provides 'ag'  end
dep 'ack-grep.managed'          do provides 'ack' end

dep 'vagrant.installer' do
  requires 'VirtualBox.installer'
  source 'https://releases.hashicorp.com/vagrant/1.9.8/vagrant_1.9.8_x86_64.dmg'
end
