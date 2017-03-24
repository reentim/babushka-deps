dep 'osx' do
  requires 'apps'
  requires 'dropbox-backups'
  requires 'migration-prompt'
  requires 'preferences'
end

dep 'linux-vm' do
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
  requires 'current-projects'
  requires 'homebrew-packages'
  requires 'dotfiles'
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
