dep 'vim' do
  requires {
    on :linux, 'vim.src'
    on :osx, [
      'macvim.managed',
      'vim.managed'
    ]
  }

  requires 'command-t'
  requires 'you-complete-me'
  requires 'stock-ultisnips-removed'
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

dep 'python-dev.managed' do
  installs 'python-dev'
  provides []
end

dep 'command-t', :ruby_path do
  ruby_path.default "/usr/bin"

  met? { '~/.dotfiles/vim/bundle/command-t/ruby/command-t/ext.o'.p.exists? }
  meet {
    log_block "Making command-t with #{ruby_path}ruby" do
      cd "#{ENV['HOME']}/.dotfiles/vim/bundle/command-t/ruby/command-t" do
        shell "#{ruby_path if ruby_path.set?}ruby extconf.rb"
        shell "make"
      end
    end
  }
end

dep 'you-complete-me' do
  requires 'dotfiles'
  requires 'cmake.managed'

  met? { '~/.dotfiles/vim/bundle/you-complete-me/python/ycm_core.so'.p.exists? }
  meet {
    cd "~/.dotfiles/vim/bundle/you-complete-me" do
      shell "./install.sh"
    end
  }
end

dep 'cmake.managed' do
  installs 'cmake'
  provides 'cmake'
end

dep 'stock-ultisnips-removed' do
  met? { !'~/.dotfiles/vim/bundle/ultisnips/UltiSnips/all.snippets'.p.exists? }
  meet { `rm ~/.dotfiles/vim/bundle/ultisnips/UltiSnips/*` }
end
