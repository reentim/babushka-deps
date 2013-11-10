dep 'osx-dev' do
  requires 'osx'
  requires 'dev apps'
  requires 'xcode tools'
  requires 'homebrew'
  requires 'ruby'
  requires 'node'
  requires 'dotfiles'.with(nil)
  requires 'scripts'
  requires 'tools'
  requires 'zsh'
end

dep 'scripts' do
  met? { '~/bin/README.md'.p.exists?  }
  meet {
    git 'git@github.com:reentim/scripts.git', :to => '~/bin'
  }
end
