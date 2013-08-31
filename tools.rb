dep 'tools' do
  requires 'vim'
  requires 'zsh'
  requires 'tmux.src'
  requires 'ack.src'
  requires 'tree.managed'
end

dep 'ack.src' do
  met? {
    version = `ack --version 2> /dev/null`.split[1].to_f
    version > 2.0
  }
  meet {
    shell "curl http://beyondgrep.com/ack-2.04-single-file > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack", :sudo => true
  }
end

dep 'tree.managed'
