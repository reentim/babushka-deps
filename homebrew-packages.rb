dep 'homebrew-packages' do
  requires %w[
    bash-completion.managed
    cmake.managed
    colordiff.managed
    coreutils.managed
    direnv.managed
    git.managed
    go.managed
    hub.managed
    jrnl.managed
    macvim.managed
    openssl.managed
    p7zip.managed
    postgresql.managed
    redis.managed
    ruby-install.managed
    ssh-copy-id.managed
    terminal-notifier.managed
    the_silver_searcher.managed
    tig.managed
    tmux.managed
    tree.managed
    watch.managed
    wdiff.managed
    yarn.managed
    z.managed
  ]
end


dep 'brew-services', :service do
  met? {
    shell("brew services list #{service}") =~ /#{service}\s+started/
  }
  meet {
    log_shell(
      "brew services start #{service}",
      "brew services start #{service}",
    )
  }
end

dep 'ack.managed'
dep 'colordiff.managed'
dep 'direnv.managed'
dep 'doctl.managed'
dep 'git.managed'
dep 'go.managed'
dep 'hub.managed'
dep 'irssi.managed'
dep 'jrnl.managed'
dep 'node.managed'
dep 'openssl.managed'
dep 'rbenv.managed'
dep 'ruby-build.managed'
dep 'ruby-install.managed'
dep 'ssh-copy-id.managed'
dep 'terminal-notifier.managed'
dep 'tig.managed'
dep 'tmux.managed'
dep 'tree.managed'
dep 'vim.managed'
dep 'watch.managed'
dep 'watchman.managed'
dep 'wdiff.managed'
dep 'yarn.managed'

dep 'coreutils.managed' do
  provides 'gls'
end

dep 'macvim.managed' do
  provides 'mvim'
end

dep 'p7zip.managed' do
  provides '7z'
end

dep 'postgresql.managed' do
  provides 'postgres'

  requires { on :osx, 'brew-services'.with('postgresql') }
end

dep 'python.managed' do
  provides ['python', 'pip']
end

dep 'redis.managed' do
  provides 'redis-server'

  requires { on :osx, 'brew-services'.with('redis') }
end

dep 'the_silver_searcher.managed' do
  provides 'ag'
end

dep 'bash-completion.managed' do
  provides []
end

dep 'chruby.managed' do
  provides 'chruby-exec'
  requires 'default-ruby-version'
end

dep 'imagemagick.managed' do
  provides []
end

dep 'z.managed' do
  provides []
end
