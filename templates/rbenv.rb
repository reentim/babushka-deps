meta :rbenv do
  accepts_value_for :builds, :basename

  template {
    def version
      builds
    end

    requires 'rbenv'

    met? {
      log_shell("Looking for version: #{version}", 'rbenv versions')
      shell('rbenv versions')[/#{version}\b/]
    }

    meet {
      log_shell "ruby-build #{version}", "rbenv install #{version}"
    }

    after {
      log_shell 'rbenv rehash', 'rbenv rehash'
    }
  }
end
