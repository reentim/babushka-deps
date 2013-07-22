dep 'vim.src' do
  requires 'libncurses5-dev.managed'

  source 'https://github.com/b4winckler/vim/archive/master.tar.gz'
  provides 'vim'

#   configure do
#     configure_args '--with-features=huge --disable-largefile --enable-perlinterp --enable-pythoninterp --enable-rubyinterp --with-ruby-command=/usr/bin/ruby'
#   end
end
