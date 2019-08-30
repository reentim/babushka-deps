module Chruby
  def self.shell(*args)
    shell?(*args)
  end

  def self.shell?(path, command)
    system %Q{
      source /usr/local/opt/chruby/share/chruby/chruby.sh
      source /usr/local/opt/chruby/share/chruby/auto.sh
      source /usr/local/share/gem_home/gem_home.sh

      cd #{path}
      gem_home .
      #{command}
    }
  end
end
