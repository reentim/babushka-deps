require 'yaml'

dep 'ruby', :version do
  version.default!('ruby')

  requires 'ruby-install'.with(version)
  requires 'ruby-version-managed'
  requires 'gem_home'
end

dep 'ruby-install', :version do
  requires 'ruby-install.managed'

  def expected_ruby_version
    if version.to_s == 'ruby'
      YAML.load(%x[ruby-install])["Stable ruby versions"]["ruby"].split(/\s/).last
    else
      version.to_s
    end
  end

  def expected_ruby_binary
    File.join(Dir.home, '.rubies', "ruby-#{expected_ruby_version}", 'bin', 'ruby')
  end

  met? { shell? "#{expected_ruby_binary} --version" }
  meet { shell "ruby-install #{version}" }
end

dep 'ruby-version-managed' do
  requires 'chruby.managed'

  met? { which('ruby') != '/usr/bin/ruby' }
  meet {
    unmeetable! "Can't see new rubies, maybe restart shell or "
  }
end

dep 'gem_home' do
  source = 'https://raw.github.com/postmodern/gem_home/master/homebrew/gem_home.rb'

  met? { shell? "brew list | grep gem_home" }
  meet { shell "brew install --HEAD #{source}" }
end
