dep 'tmux.src' do
  requires 'libevent-dev.managed'
  requires 'libncurses5-dev.managed'

  source 'http://sourceforge.net/projects/tmux/files/latest/download'
  provides 'tmux'
end

dep 'libncurses5-dev.managed' do
  installs 'libncurses5-dev'
  provides []
end

dep 'libevent-dev.managed' do
  installs 'libevent-dev'
  provides []
end

