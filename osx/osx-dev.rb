dep 'osx-dev' do
  requires %w[
    osx
    dev-apps
    homebrew
    homebrew-packages
    ruby
    node
    dotfiles
    scripts
    zsh
  ]
  requires 'xcode tools'
end

dep 'scripts' do
  met? { '~/bin/README.md'.p.exists? }
  meet {
    git 'git@github.com:reentim/scripts.git', :to => '~/bin'
  }
end
