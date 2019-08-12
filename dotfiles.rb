dotfiles_path = File.join(Dir.home, '.dotfiles')

dep 'dotfiles', :path do
  path.default!(dotfiles_path)

  requires 'dotfiles.repo'.with(path)
  requires 'dotfiles-installed'.with(path)
end

dep 'dotfiles.repo', :path do
  source 'git@github.com:reentim/dotfiles.git'
  target path
end

dep 'dotfiles-installed', :path do
  # path is not defined within the requires block, when attempting to pass :(
  requires { on :osx, 'dotfiles-keybindings' }
  requires 'dotfiles-italic-terminals'

  met? { "#{ENV['HOME']}/.aliases".p.exists? }
  met? { "#{ENV['HOME']}/.vim".p.exists? }

  meet {
    system %Q{
      cd #{path}
      rake install
      git submodule update --init --recursive
    }
  }
end

dep 'dotfiles-keybindings', :path do
  path.default!(dotfiles_path)

  met? { "#{ENV['HOME']}/Library/KeyBindings/DefaultKeyBinding.dict".p.exists? }
  meet {
    system %Q{
      cd #{path}
      rake keybindings
    }
  }
end

dep 'dotfiles-italic-terminals', :path do
  path.default!(dotfiles_path)

  met? { ['tmux-256color', 'xterm-256color-italic'].include? ENV['TERM'] }
  meet {
    cd path do
      shell "rake italic_terminals"
    end

    unmeetable! "iTerm > Profiles > Terminal > Report terminal type: xterm-256color-italic"
  }
end
