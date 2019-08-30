require 'yaml'
require_relative 'helpers/chruby'

dep 'ruby', :version do
  version.default!('ruby')

  requires 'ruby-install'.with(version)
  requires 'ruby-version-managed'
  requires 'gem_home'
end

dep 'ruby.src' do
  source 'ftp://ftp.ruby-lang.org/pub/ruby/stable-snapshot.tar.gz'
  provides 'ruby > 2.0.0'
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

dep 'bundles-installed', :path do
  requires 'reentim:bundler-installed'.with(path)

  met? {
    cd path do
      Chruby.shell?(path, "bundle check")
    end
  }
  meet {
    cd path do
      Chruby.shell(path, "bundle install")
    end
  }
end

dep 'bundler-installed', :path do
  def version
    lockfile = File.readlines(File.join(path, 'Gemfile.lock'))
    lockfile[lockfile.index("BUNDLED WITH\n") + 1].strip.chomp
  end

  met? { Chruby.shell?(path, "gem list bundler --quiet | grep 'bundler (#{version})'") }
  meet { Chruby.shell(path, "gem install bundler --version #{version}") }
end
