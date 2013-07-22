dep 'tmux.src' do
  requires 'libevent-dev.managed'
  requires 'libncurses5-dev.managed'

  source 'http://sourceforge.net/projects/tmux/files/latest/download'
  provides 'tmux'
end
