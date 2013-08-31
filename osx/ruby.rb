dep 'ruby' do
  requires [
    'rbenv.managed',
    'ruby-build.managed',
    '2.0.0-p247.rbenv',
    'global ruby'.with('2.0.0-p247'),
    'bundler.gem',
    'vagrant.gem'
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

dep '2.0.0-p247.rbenv'
dep 'vagrant.gem'
dep 'rbenv.managed'
dep 'ruby-build.managed'

dep 'bundler.gem' do
  provides 'bundle'
end
