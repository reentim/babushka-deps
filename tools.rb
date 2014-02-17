dep 'tools' do
  requires 'vim'
  requires 'zsh'
  requires 'tmux.src'
  requires 'ack.src'
  requires 'tree.managed'
  requires 'zeus.gem'
  requires 'ag'
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

dep 'ag' do
  requires %W{
    libpcre3-dev.managed
    zlib1g-dev.managed
    liblzma-dev
  }
  met? {
    which "ag"
  }
  meet {
    uri = 'https://github.com/ggreer/the_silver_searcher/archive/master.tar.gz'
    Babushka::Resource.extract(uri)
    cd "~/.babushka/build/master/the_silver_searcher-master" do
      shell "./build.sh"
      shell "make install", :sudo => true
    end
  }
end

dep 'tree.managed'
dep 'zeus.gem'
dep 'libpcre3-dev.managed' do provides [] end
dep 'zlib1g-dev.managed'   do provides [] end
dep 'liblzma-dev' do
  met? { shell? "dpkg -s liblzma-dev" }
  meet {
    shell "apt-get install -y --force-yes liblzma-dev", :sudo => true
  }
end
