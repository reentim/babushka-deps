dep 'dev-tools' do
  requires {
    on :linux, %w[
      tmux.managed
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

dep 'silversearcher-ag.managed' do
  provides 'ag'
end
