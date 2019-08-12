dep 'dev-tools' do
  requires {
    on :linux, %w[
      tmux.managed
      silversearcher-ag.managed
    ]

    on :osx, %w[
      iTerm.app
      homebrew
      homebrew-packages
      vagrant.installer
      zsh.managed
    ]
  }

  requires 'gems'
  requires 'tree.managed'
  requires 'vagrant.installer'
end

dep 'silversearcher-ag.managed' do
  provides 'ag'
end
