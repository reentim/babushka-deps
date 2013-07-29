dep 'vim' do
  requires 'vim.src'
  requires 'command-t'
  requires 'you-complete-me'
  requires 'stock ultisnips removed'
end

dep 'vim.src' do
  requires 'libncurses5-dev.managed'
  requires 'python-dev.managed'

  met? {
    if which 'vim'
      version = `vim --version`
      version.include?('+ruby') &&
      version.include?('+python')
    end
  }

  source 'ftp://ftp.vim.org/pub/vim/unstable/unix/vim-7.4a.tar.bz2'
  configure_args '--with-features=huge \
                  --disable-gui \
                  --enable-rubyinterp \
                  --enable-pythoninterp \
                  --with-python-config-dir=/usr/lib/python2.7/config'
  provides 'vim'
end

dep 'command-t' do
  requires 'dotfiles'
  requires 'vim.src'

  met? { '~/.dotfiles/vim/bundle/command-t/ruby/command-t/ext.o'.p.exists? }
  meet {
    system %Q{
      cd ~/.dotfiles/vim/bundle/command-t/ruby/command-t/
      ruby extconf.rb
      make
    }
  }
end

dep 'you-complete-me' do
  requires 'dotfiles'
  requires 'vim.src'
  requires 'cmake.managed'

  met? { '~/.dotfiles/vim/bundle/you-complete-me/python/ycm_core.so'.p.exists? }
  meet {
    system %Q{
      cd ~/.dotfiles/vim/bundle/you-complete-me
      ./install.sh
    }
  }
end

dep 'stock ultisnips removed' do
  met? { !'~/.dotfiles/vim/bundle/ultisnips/UltiSnips/all.snippets'.p.exists? }
  meet { `rm ~/.dotfiles/vim/bundle/ultisnips/UltiSnips/*` }
end
