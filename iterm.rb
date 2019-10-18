dep 'iterm' do
  requires %w[
    iTerm.app
    iterm-runtime-installed
    iterm-scripts
  ]
end

dep 'iterm-runtime-installed' do
  met? {
    "~/Library/ApplicationSupport/iTerm2/iterm2env/versions/3.7.2/bin/python3".p.exists?
  }
  meet { unmeetable! "Scripts > Manage > Install Python Runtime" }
end

dep 'iterm-scripts' do
  requires 'iterm-runtime-installed'
  requires 'symlink'.with(
    source: "~/.dotfiles/iTerm/Scripts",
    target: "~/Library/Application Support/iTerm2/Scripts",
  )
end
