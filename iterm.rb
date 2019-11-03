dep 'iterm' do
  requires %w[
    iTerm.app
    iterm-scripts
  ]
end

dep 'iterm-scripts' do
  requires %w[
    iterm-runtime-installed
    iterm-scripts-linked
  ]
end

dep 'iterm-scripts-linked' do
  requires 'iterm-scripts-dir-removed'
  requires 'iterm-runtime-installed'
  requires 'symlink'.with(
    source: "~/.dotfiles/iTerm/Scripts",
    target: "~/Library/Application Support/iTerm2/Scripts",
  )
end

dep 'iterm-runtime-installed' do
  met? {
    "~/Library/ApplicationSupport/iTerm2/iterm2env/versions/3.7.2/bin/python3".p.exists?
  }
  meet { unmeetable! "Scripts > Manage > Install Python Runtime" }
end

dep 'iterm-scripts-dir-removed' do
  dir = "~/Library/Application Support/iTerm2/Scripts".p
  met? { dir.symlink? || !dir.exists? }
  meet {
    unmeetable! "#{dir} not empty" unless dir.empty?

    log "Removing #{dir}"
    dir.rmdir
  }
end
