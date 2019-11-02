dep 'osx' do
  requires 'apps'
  requires 'dropbox-backups'
  requires 'migration-prompt'
  requires 'preferences'
end

dep 'linux-vm' do
  requires 'ubuntu-rails'
  requires 'dev-tools'
  requires 'dotfiles'.with(:install_ssh_socket_hack)
end

dep 'osx-dev' do
  requires 'dev-apps'
  requires 'dev-tools'
  requires 'dotfiles'
  requires 'node'
  requires 'osx'
  requires 'ruby'
  requires 'xcode tools'
end

dep 'MacBookPro-2016' do
  requires 'ruby'
  requires 'gems'
  requires 'homebrew-packages'
  requires 'dotfiles'
  requires 'zsh'
end

dep 'iMac' do
  requires 'iTerm.app'
  requires 'Alfred.app'
  requires 'Google Chrome.app'
  requires 'ImageOptim.app'
  requires 'ImageAlpha.app'
  requires 'VLC.app'
  requires 'Flux.app'
  requires 'Last.fm.app'
  requires 'homebrew'
  requires 'dev-tools'
  requires 'zsh'
  requires 'ruby'
  requires 'node'
  requires 'command-t'
  requires 'dotfiles'
  requires 'zsh.managed'
end

dep 'MacBook-Pro-2017' do
  requires 'ruby'
  requires 'preferences'

  requires 'dev-tools'
  requires 'node'
  requires 'dotfiles'

  requires 'Alfred.app'
  requires 'Google Chrome.app'
  requires 'iTerm.app'
  requires 'Docker.app'
end

dep 'MacBook-Pro-2019' do
  requires 'apps-2019'
  requires 'deps-pushable'
  requires 'dotfiles'
  requires 'zsh'
  requires 'dev-tools'
  requires 'private:mab'
end

dep 'apps-2019' do
  requires %w[
    1Password\ 7.installer
    Alfred.app
    Docker.app
    Firefox.app
    Google\ Chrome.app
    ImageAlpha.app
    ImageOptim.app
    Moom.app
    Slack.app
    Dash.app
  ]
end

dep 'common' do
  requires %w[
    iterm
    deps
    dotfiles-linked
    cloud
  ]
end
