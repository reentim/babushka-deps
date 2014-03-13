dep 'node' do
    requires [
      'node-brew',
      'npm',
      'node-packages',
    ]
end

# NPM is broken under Homebrew: https://github.com/Homebrew/homebrew/issues/22408
dep 'node-brew' do
  met? { which 'node' }
  meet {
    log_shell 'Installing node without npm', 'brew install node --without-npm'
  }
end

dep 'node-packages' do
  requires %w[
    coffee-script.npm
    underscore.npm
    bower.npm
    grunt-cli.npm
  ]
end

dep 'coffee-script.npm' do provides 'coffee' end
dep 'underscore.npm'
dep 'bower.npm'
dep 'grunt-cli.npm'
