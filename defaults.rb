dep 'preferences' do
  requires %w[
    dock-auto-hide.defaults
    trackpad-tap-to-click.defaults
  ]
end

dep "dock-auto-hide.defaults" do
  write "com.apple.dock autohide -bool", true
  unwrite "com.apple.dock autohide -bool", false
end

dep "trackpad-tap-to-click.defaults" do
  write "com.apple.AppleMultitouchTrackpad Clicking -bool", true
  unwrite "com.apple.AppleMultitouchTrackpad Clicking -bool", false
end
