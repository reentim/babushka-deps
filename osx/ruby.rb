dep 'ruby' do
  requires [
    'rbenv.managed',
    'ruby-build.managed',
    'rbenv-readline.managed',
    '2.0.0-p247.rbenv',
    'global ruby'.with('2.0.0-p247'),
    'bundler.gem'
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
dep '2.0.0-p247.rbenv'

dep 'bundler.gem' do
  provides 'bundle'
end
