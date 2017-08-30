dep 'homebrew-packages' do
  requires %w[
    ack.managed
    bash-completion.managed
    cmake.managed
    colordiff.managed
    coreutils.managed
    direnv.managed
    git.managed
    go.managed
    hub.managed
    imagemagick.managed
    irssi.managed
    jrnl.managed
    macvim.managed
    openssl.managed
    p7zip.managed
    postgresql.managed
    rbenv-ctags.managed
    redis.managed
    ssh-copy-id.managed
    terminal-notifier.managed
    the_silver_searcher.managed
    tmux.managed
    tree.managed
    vim.managed
    watch.managed
    watchman.managed
    yarn.managed
    z.managed
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

dep 'ack.managed'
dep 'colordiff.managed'
dep 'direnv.managed'
dep 'go.managed'
dep 'hub.managed'
dep 'irssi.managed'
dep 'jrnl.managed'
dep 'node.managed'
dep 'openssl.managed'
dep 'rbenv.managed'
dep 'ruby-build.managed'
dep 'ssh-copy-id.managed'
dep 'terminal-notifier.managed'
dep 'tmux.managed'
dep 'vim.managed'
dep 'watch.managed'

dep 'coreutils.managed'           do provides 'gls' end
dep 'heroku.managed'              do provides 'heroku' end
dep 'watchman.managed'
dep 'yarn.managed'

dep 'coreutils.managed'           do provides 'gls' end
dep 'macvim.managed'              do provides 'mvim' end
dep 'p7zip.managed'               do provides '7z' end
dep 'postgresql.managed'          do provides 'postgres' end
dep 'python.managed'              do provides ['python', 'pip'] end
dep 'redis.managed'               do provides 'redis-server' end
dep 'the_silver_searcher.managed' do provides 'ag' end
dep 'yarn.managed'                do provides 'yarn' end

dep 'bash-completion.managed'     do provides [] end
dep 'chruby.managed'              do provides [] end
dep 'imagemagick.managed'         do provides [] end
dep 'phantomjs.managed'           do provides [] end
dep 'rbenv-ctags.managed'         do provides [] end
dep 'z.managed'                   do provides [] end
