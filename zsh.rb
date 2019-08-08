dep 'zsh', :username do
  username.default!(shell('whoami'))

  requires 'zsh.shell_setup'

  met? {
    !shell("dscacheutil -q user -a name `whoami`").match(%r{^shell: #{which(basename)}}).nil?
  }
  meet {
    sudo("chsh -s '#{which('zsh')}' #{username}")
  }
end

dep 'zsh.shell_setup' do
  requires 'zsh.managed'
end

dep 'zsh.managed'
