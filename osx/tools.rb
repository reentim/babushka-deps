dep 'tools' do
  requires [
    'ssh-copy-id.managed',
    'git.managed',
    'bash-completion.managed',
    'tmux.managed',
    'macvim.managed',
    'tree.managed',
    'coreutils.managed',
    'z.managed',
    'ack.managed'
  ]
end

dep 'ssh-copy-id.managed'

dep 'git.managed' do
  requires 'babushka git removed'
end

dep 'babushka git removed' do
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

dep 'bash-completion.managed' do
  provides []
end

dep 'tmux.managed'

dep 'tree.managed'

dep 'coreutils.managed' do
  provides 'gls'
end

dep 'ack.managed'

dep 'macvim.managed' do
  provides 'mvim'
  if !"/Applications/MacVim.app/Contents".p.directory?
    log_shell "Linking MacVim.app", "ln -s /usr/local/Cellar/macvim/7.4-70/MacVim.app /Applications"
  end
end
