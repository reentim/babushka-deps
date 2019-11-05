dep 'vim' do
  requires 'vim.src'
  requires 'command-t'
end

dep 'vim.src' do
  met? {
    if which 'vim'
      version = `vim --version`
      version.include?(format("Compiled by %s@%s", `whoami`.chomp, `hostname`.chomp)) &&
      version.include?('+ruby') &&
      version.include?('+python')
    end
  }

  provides 'vim ~> 8.1.2'

  source 'https://github.com/vim/vim/archive/v8.1.2256.tar.gz'

  # TODO: figure out why I can't use the git source, without encountering
  # /usr/local/babushka/lib/babushka/asset.rb:177:in `for': Don't know how to extract vim.`
  # like it's expecting an extractable
  # ---
  # source 'git://github.com:vim/vim.git'

  configure_args '--with-features=huge \
                  --disable-gui \
                  --enable-rubyinterp \
                  --enable-pythoninterp \
                  --with-python-config-dir=/usr/lib/python2.7/config'
end

dep 'command-t', :ruby_path do
  dir = "~/.vim/bundle/command-t/ruby/command-t/ext/command-t".p
  met? { "#{dir}/ext.o".p.exists? }
  meet {
    log_block "Making command-t" do
      cd dir do
        shell "ruby extconf.rb"
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

dep 'stock-ultisnips-removed' do
  met? { !'~/.dotfiles/vim/bundle/ultisnips/UltiSnips/all.snippets'.p.exists? }
  meet { `rm ~/.dotfiles/vim/bundle/ultisnips/UltiSnips/*` }
end
