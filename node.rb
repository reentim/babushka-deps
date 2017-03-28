dep 'node' do
    requires [
      'node.managed',
      'npm',
      'node-packages',
    ]
end

# # NPM is broken under Homebrew: https://github.com/Homebrew/homebrew/issues/22408
# dep 'node-brew' do
#   met? { which 'node' }
#   meet {
#     log_shell 'Installing node without npm', 'brew install node'
#   }
# end

dep 'node-ubuntu' do
  requires 'nodesource'
  requires 'nodejs.managed'
end

dep 'nodesource' do
  met? { "/etc/apt/sources.list.d/nodesource.list".p.exists? }
  meet {
    log_shell(
      "Installing nodejs from nodesource",
      "curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -"
    )
  }
end

dep 'node-packages' do
  requires %w[
    coffee-script.npm
    underscore.npm
    bower.npm
    grunt-cli.npm
    yo.npm
  ]
end

dep 'nodejs.managed'

dep 'bower.npm'
dep 'coffee-script.npm' do provides 'coffee' end
dep 'grunt-cli.npm'
dep 'node.managed'
dep 'underscore.npm'
dep 'yo.npm'
