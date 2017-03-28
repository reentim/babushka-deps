NEW_RUBY_VERSION = "2.4.1"

dep 'ruby' do
  requires [
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

dep 'rbenv' do
  requires {
    on :osx, ['rbenv.managed', 'ruby-build.managed']
    on :linux, ['rbenv-git', 'rbenv-environment', 'ruby-build-git']
  }
end

dep 'rbenv-git' do
  requires 'git.managed'
  requires 'rbenv-environment'

  met? { which 'rbenv' }
  meet {
    git "https://github.com/rbenv/rbenv.git", to: "#{ENV['HOME']}/.rbenv"
  }
  after { log "Needs logout" }
end

dep 'rbenv-environment' do
  met? { "#{ENV['HOME']}/.bashrc".p.grep(/rbenv/) }
  meet {
    shell %Q[echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> #{ENV['HOME']}/.bashrc]
    shell %Q[echo 'eval "$(rbenv init -)"' >> #{ENV['HOME']}/.bashrc]
  }
end

dep 'ruby-build-git' do
  requires 'ruby-build-environment'

  met? { which 'ruby-build' }
  meet {
    git "https://github.com/rbenv/ruby-build.git", to: "#{ENV['HOME']}/.rbenv/plugins/ruby-build"
  }
end

dep 'ruby-build-environment' do
  met? { "#{ENV['HOME']}/.bashrc".p.grep(/ruby-build/) }
  meet { 
    shell %Q[echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> #{ENV['HOME']}/.bashrc]
  }
end
