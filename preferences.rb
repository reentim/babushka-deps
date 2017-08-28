dep 'preferences' do
  def defaults_write(domain, key, type, value)
    shell "defaults write #{domain} #{key} -#{type} #{value}"
  end

  # Dock
  defaults_write 'com.apple.dock', 'autohide', 'bool', true
end
