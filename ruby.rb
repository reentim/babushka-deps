NEW_RUBY_VERSION = "2.3.0"

dep 'ruby' do
  requires [
    'rbenv.managed',
    'ruby-build.managed',
    'rbenv-readline.managed',
    "#{NEW_RUBY_VERSION}.rbenv",
    'global ruby'.with(NEW_RUBY_VERSION),
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

dep "#{NEW_RUBY_VERSION}.rbenv"
