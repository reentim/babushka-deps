dep 'ruby' do
  requires [
    'rbenv.managed',
    'ruby-build.managed',
    'rbenv-readline.managed',
    '2.1.0.rbenv',
    'global ruby'.with('2.1.0'),
    'bundler.gem',
    'wirble.gem',
    'github-auth.gem',
    'zeus.gem'
  ]
end

dep 'global ruby', :version do
  met? {
    shell('rbenv global')[/#{version}\b/]
  }
  meet {
    shell "rbenv global #{version}"
  }
  after {
    shell 'rbenv rehash'
  }
end

dep 'rbenv.managed'
dep 'ruby-build.managed'
dep 'rbenv-readline.managed' do
  provides []
end

dep '2.1.0.rbenv'

dep 'bundler.gem' do
  provides 'bundle'
end

dep 'github-auth.gem' do
  provides 'gh-auth'
end

dep 'wirble.gem' do
  provides []
end

dep 'zeus.gem'
