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

dep 'node-packages' do
  requires %w[
    coffee-script.npm
    underscore.npm
    bower.npm
    grunt-cli.npm
    yo.npm
  ]
end

dep 'bower.npm'
dep 'coffee-script.npm' do provides 'coffee' end
dep 'grunt-cli.npm'
dep 'node.managed'
dep 'underscore.npm'
dep 'yo.npm'
