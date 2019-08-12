dep 'preferences' do
  def defaults_write(domain, key, type, value, sudo: false)
    shell "defaults write #{domain} #{key} -#{type} #{value}", sudo: sudo
  end

  # Dock autohide
  defaults_write 'com.apple.dock', 'autohide', 'bool', true

  # Tap to click
  defaults_write 'com.apple.AppleMultitouchTrackpad', 'Clicking', 'bool', true
end
