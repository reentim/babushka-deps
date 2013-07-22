dep 'vim' do
  requires 'vim.src'
  requires 'command-t'
end

dep 'vim.src' do
  requires 'libncurses5-dev.managed'
  requires 'python-dev.managed'

  met? {
    vim = `vim --version`
    vim.include? '+ruby'
    vim.include? '+python'
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
