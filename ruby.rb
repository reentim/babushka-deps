dep 'ruby' do
  requires [
    'rbenv.managed',
    'ruby-build.managed',
    'rbenv-readline.managed',
    '2.1.0.rbenv',
    'global ruby'.with('2.1.0'),
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

dep '2.1.0.rbenv'
