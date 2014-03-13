dep 'homebrew-packages' do
  requires %w[
    ack.managed
    bash-completion.managed
    coreutils.managed
    git.managed
    heroku-toolbelt.managed
    macvim.managed
    rbenv-ctags.managed
    ssh-copy-id.managed
    the_silver_searcher.managed
    tmux.managed
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
dep 'rbenv.managed'
dep 'ruby-build.managed'
dep 'ssh-copy-id.managed'
dep 'tmux.managed'

dep 'bash-completion.managed'     do provides [] end
dep 'coreutils.managed'           do provides 'gls' end
dep 'heroku-toolbelt.managed'     do provides 'heroku' end
dep 'macvim.managed'              do provides 'mvim' end
dep 'rbenv-ctags.managed'         do provides [] end
dep 'rbenv-readline.managed'      do provides [] end
dep 'the_silver_searcher.managed' do provides 'ag' end
dep 'z.managed'                   do provides [] end
