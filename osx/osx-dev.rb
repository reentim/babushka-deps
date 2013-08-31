dep 'osx-dev' do
  requires 'osx'
  requires 'dev apps'
  requires 'xcode tools'
  requires 'homebrew'
  requires 'libraries'
  requires 'ruby'
  requires 'node'
  requires 'dotfiles'
  requires 'scripts'
  requires 'tools'
  requires 'zsh'
end

dep 'scripts' do
  met? { '~/bin/README.md'.p.exists?  }
  meet {
    git 'git@github.com:reentim/scripts.git', to: '~/bin'
  }
end

dep 'libraries' do
  requires 'readline.managed'
end

dep 'readline.managed' do
  provides []
end
