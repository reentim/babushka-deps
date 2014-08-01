dep 'dev-tools' do
  requires {
    on :linux, %w[
      ack.src
      ag-src
      tmux.src
      zsh.src
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

dep 'ack.src' do
  met? {
    version = `ack --version 2> /dev/null`.split[1].to_f
    version > 2.1
  }
  meet {
    system %q{sudo bash -c "curl http://beyondgrep.com/ack-2.12-single-file > /usr/local/bin/ack"}
    shell "chmod 0755 /usr/local/bin/ack", :sudo => true
  }
end

dep 'ag-src' do
  requires %w[
    libpcre3-dev.managed
    zlib1g-dev.managed
    liblzma-dev
  ]
  met? { which "ag" }
  meet {
    uri = 'https://github.com/ggreer/the_silver_searcher/archive/master.tar.gz'
    Babushka::Resource.extract(uri)
    cd "~/.babushka/build/master/the_silver_searcher-master" do
      shell "./build.sh"
      shell "make install", :sudo => true
    end
  }
end

dep 'libpcre3-dev.managed' do provides [] end
dep 'zlib1g-dev.managed'   do provides [] end
dep 'liblzma-dev' do
  met? { shell? "dpkg -s liblzma-dev" }
  meet { shell "apt-get install -y --force-yes liblzma-dev", :sudo => true }
end

dep 'tree.managed'
