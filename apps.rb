dep 'apps' do
  requires %w[
    Airfoil.app
    Alfred.app
    Arq.app
    Dropbox.app
    Flux.app
    Geekbench.app
    ImageAlpha.app
    ImageOptim.app
    Moom.app
    Shiori.app
    Spotify.app
    Transmission.app
    VLC.app
    iPhoto.appstore
  ]

  requires 'Google Chrome.app'
end

dep 'dev-apps' do
  requires %w[
    Firefox.app
    GitHub.app
    VirtualBox.installer
    iTerm.app
  ]
  requires "Google Chrome Canary.app"
  requires "Sequel Pro.app"
end

dep '1Password.appstore'

dep 'Airfoil.app' do
  source 'http://neutral.rogueamoeba.com/mirror/files/Airfoil.zip'
end

dep 'Alfred.app' do
  source 'https://cachefly.alfredapp.com/Alfred_3.4.1_860.dmg'
end

dep 'Arq.app' do
  source 'http://www.haystacksoftware.com/arq/Arq.zip'
end

dep 'Dropbox.app' do
  source 'https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%202.0.26.dmg'
end

dep 'Firefox.app' do
  source 'http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/24.0/mac/en-US/Firefox%2024.0.dmg'
end

dep 'Flux.app' do
  source 'https://justgetflux.com/mac/Flux.zip'
end

dep 'Geekbench.app' do
  source 'http://d34wv75roto0rl.cloudfront.net/Geekbench-3.0.2-Mac.zip'
end

dep 'GitHub.app' do
  source 'https://central.github.com/mac/latest'
end

dep 'Google Chrome Canary.app' do
  source 'https://storage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg'
end

dep 'Google Chrome.app' do
  source 'https://dl.google.com/chrome/mac/stable/GoogleChrome.dmg'
end

dep 'ImageAlpha.app' do
  source 'http://pngmini.com/ImageAlpha1.4.0.tar.bz2'
end

dep 'ImageOptim.app' do
  source 'https://imageoptim.com/ImageOptim.tbz2'
end

dep 'Moom.app' do
  source 'http://manytricks.com/download/moom'
end

dep 'Sequel Pro.app' do
  source 'https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg'
end

dep 'Shiori.app' do
  source 'http://aki-null.net/shiori/release/Shiori_1.0.1.zip'
end

dep 'Spotify.app' do
  source 'http://download.spotify.com/Spotify.dmg'
end

dep 'Transmission.app' do
  source 'http://download.transmissionbt.com/files/Transmission-2.82.dmg'
end

dep 'VLC.app' do
  source 'http://get.videolan.org/vlc/2.2.1/macosx/vlc-2.2.1.dmg'
end

dep 'VirtualBox.installer' do
  source 'http://download.virtualbox.org/virtualbox/5.1.26/VirtualBox-5.1.26-117224-OSX.dmg'
  provides 'VirtualBox', 'VboxManage', 'VBoxHeadless'
end

dep 'iPhoto.appstore'

dep 'iTerm.app' do
  source 'https://iterm2.com/downloads/stable/iTerm2-3_0_15.zip'
  provides 'iTerm.app >= 3.0'
end

dep 'Last.fm.app' do
  source 'http://cdn.last.fm/client/Mac/Last.fm-2.1.36.zip'
end

dep 'Docker.app' do
  source 'https://download.docker.com/mac/stable/Docker.dmg'
end
