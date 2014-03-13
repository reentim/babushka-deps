dep 'preferences' do
  requires 'longer-standby-delay'

  def defaults_write(domain, key, type, value)
    shell "defaults write #{domain} #{key} -#{type} #{value}"
  end

  # General
  defaults_write 'NSGlobalDomain', 'NSQuitAlwaysKeepsWindows', 'boolean', true
  defaults_write 'NSGlobalDomain', 'AppleShowScrollBars',      'string', 'WhenScrolling'

  # Keyboard
  defaults_write 'NSGlobalDomain', 'KeyRepeat',        'int', 2
  defaults_write 'NSGlobalDomain', 'InitialKeyRepeat', 'int', 15

  # Dock
  defaults_write 'com.apple.dock', 'autohide', 'bool', true
end

dep 'longer-standby-delay' do
  def standby_delay
    shell("pmset -g | grep standbydelay | awk '{print $2}'").to_i
  end
  met? { standby_delay == 43200 }
  meet {
    log_shell "Increasing standby delay to 12 hours", "pmset -a standbydelay 43200", :sudo => true
  }
end
