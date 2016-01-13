dep 'homebrew-packages' do
  requires %w[
    ack.managed
    bash-completion.managed
    cmake.managed
    coreutils.managed
    git.managed
    go.managed
    heroku-toolbelt.managed
    hub.managed
    imagemagick.managed
    irssi.managed
    openssl.managed
    p7zip.managed
    postgresql.managed
    python.managed
    rbenv-ctags.managed
    ssh-copy-id.managed
    terminal-notifier.managed
    the_silver_searcher.managed
    tmux.managed
    tree.managed
    watch.managed
    z.managed
    redis.managed
    elasticsearch.managed
    vim.managed
  ]
end

dep 'git.managed' do
  requires 'babushka-git-removed'
end

dep 'babushka-git-removed' do
  def present_dirs
    ["/usr/local/git"].select { |d| d.p.exists? }
  end
  met? {
    present_dirs.none?
  }
  meet {
    present_dirs.each do |d|
      log_shell "Removing babushka-installed #{d}", "rm -rf #{d}", :sudo => true
    end
    shell "brew prune"
  }
end

dep 'rbenv.managed' do
  requires 'rbenv-setup'
end

dep 'rbenv-setup' do
  met? { File.read("#{ENV['HOME']}/.bash_profile").lines.grep(/rbenv/).any? }
  meet {
    log_shell "Adding rbenv stuff to ~/.bash_profile", %Q[echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && echo 'eval "$(rbenv init -)"' >> ~/.bash_profile]
  }
end

dep 'ack.managed'
dep 'go.managed'
dep 'hub.managed'
dep 'irssi.managed'
dep 'ruby-build.managed'
dep 'ssh-copy-id.managed'
dep 'terminal-notifier.managed'
dep 'tmux.managed'
dep 'hub.managed'
dep 'watch.managed'
dep 'openssl.managed'
dep 'vim.managed'
dep 'terminal-notifier.managed'
dep 'watch.managed'
dep 'go.managed'
dep 'irssi.managed'
dep 'elasticsearch.managed'

dep 'coreutils.managed'           do provides 'gls' end
dep 'heroku-toolbelt.managed'     do provides 'heroku' end
dep 'macvim.managed'              do provides 'mvim' end
dep 'p7zip.managed'               do provides '7z' end
dep 'postgresql.managed'          do provides 'postgres' end
dep 'python.managed'              do provides ['python', 'pip'] end
dep 'redis.managed'               do provides 'redis-server' end
dep 'the_silver_searcher.managed' do provides 'ag' end

dep 'bash-completion.managed'     do provides [] end
dep 'imagemagick.managed'         do provides [] end
dep 'phantomjs.managed'           do provides [] end
dep 'rbenv-ctags.managed'         do provides [] end
dep 'rbenv-readline.managed'      do provides [] end
dep 'z.managed'                   do provides [] end
