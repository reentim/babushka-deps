dep 'node' do
    requires [
      'node.managed',
      'npm',
      'node-packages',
    ]
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

dep 'bower.npm'
dep 'coffee-script.npm' do provides 'coffee' end
dep 'grunt-cli.npm'
dep 'node.managed'
dep 'underscore.npm'
dep 'yo.npm'
