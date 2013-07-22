dep 'vim' do
  requires 'vim.src'
  requires 'command-t'
end

dep 'vim.src' do
  requires 'libncurses5-dev.managed'

  source 'https://github.com/b4winckler/vim/archive/master.tar.gz'
  provides 'vim'

#   configure do
#     configure_args '--with-features=huge --disable-largefile --enable-perlinterp --enable-pythoninterp --enable-rubyinterp --with-ruby-command=/usr/bin/ruby'
#   end
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
