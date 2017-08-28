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
  source 'https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1.dmg'
end
