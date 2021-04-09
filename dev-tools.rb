dep 'dev-tools' do
  requires 'homebrew-packages'
end

dep 'old-dev-tools' do
  requires {
    on :linux, %w[
      tmux.managed
      silversearcher-ag.managed
    ]

    on :osx, %w[
      iTerm.app
      homebrew
      homebrew-packages
      vagrant.installer
      xcode-command-line-tools
      zsh.managed
      alt
    ]
  }

  requires 'doctl.managed'
  requires 'heroku'
  requires 'gems'
  requires 'tree.managed'
  requires 'vagrant.installer'
end

dep 'xcode-command-line-tools' do
  met? { shell? "xcode-select -p &>/dev/null" }
  meet { shell "xcode-select --install" }
end

dep 'silversearcher-ag.managed' do
  provides 'ag'
end

dep 'alt' do
  before { shell "brew tap uptech/homebrew-oss" }
  met? { shell? "brew list | grep ^alt$" }
  meet { shell "brew install uptech/oss/alt" }
end

dep 'heroku' do
  before { shell "brew tap heroku/brew" }
  met? { shell? "brew list | grep ^heroku$" }
  meet { shell "brew install heroku" }
end

dep 'heroku-git-remotes', :target, :remote_name, :app do
  met? {
    cd target do
      shell("git remote -v").include?(
        "#{remote_name}\thttps://git.heroku.com/#{app}.git (fetch)\n" +
        "#{remote_name}\thttps://git.heroku.com/#{app}.git (push)"
      )
    end
  }
  meet {
    cd target do
      shell "git remote add #{remote_name} https://git.heroku.com/#{app}.git"
    end
  }
end

dep 'dependencies-installed', :path do
  log path
  requires 'bundles-installed'.with(path) if path.p.join('Gemfile').exists?
  requires 'packages-installed'.with(path) if path.p.join('package.json').exists?
end

dep 'packages-installed', :path do
  requires 'yarn.managed'

  met? {
    cd path do
      shell? "yarn check"
    end
  }
  meet {
    cd path do
      shell "yarn install"
    end
  }
end
