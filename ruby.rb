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
      "ruby-" + YAML.load(%x[ruby-install])["Stable ruby versions"]["ruby"].split(/\s/).last
    else
      version.to_s.gsub("\s" , "-")
    end
  end

  def expected_ruby_binary
    File.join(Dir.home, '.rubies', expected_ruby_version, 'bin', 'ruby')
  end

  met? { shell? "#{expected_ruby_binary} --version" }
  meet {
    log_shell(
      "ruby-install #{version}",
      "ruby-install #{version} --cleanup --src-dir /tmp",
    )
  }
end

dep 'ruby-version-managed' do
  requires 'chruby.managed'

  met? { which('ruby') != '/usr/bin/ruby' }
  meet {
    unmeetable! "Still on system ruby. Check hooks & restart shell."
  }
end

dep 'gem_home' do
  source = 'https://raw.github.com/postmodern/gem_home/master/homebrew/gem_home.rb'

  met? { shell? "brew list | grep gem_home" }
  meet { shell "brew install --HEAD #{source}" }
end

dep 'default-ruby-version' do
  met? { "~/.ruby-version".p.exists? }
  meet { "~/.ruby-version".p.write("ruby") }
end
