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
  requires 'vim'
end

dep 'tree.managed'
dep 'silversearcher-ag.managed' do provides 'ag'  end
dep 'ack-grep.managed'          do provides 'ack' end
