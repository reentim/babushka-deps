dep 'apps' do
  requires [
    'Dropbox.app',
    'Google Chrome.app',
    'Moom.app',
    'iPhoto.appstore',
    'Alfred.app',
    'Arq.app',
    'Flux.app',
    'Spotify.app',
    'Transmission.app',
    'Shiori.app',
    'Geekbench.app',
    'ImageAlpha.app',
    'ImageOptim.app',
    'VLC.app',
    'Airfoil.app'
  ]
end

dep 'dev apps' do
  requires [
    'VirtualBox.installer',
    'iTerm.app',
    'GitHub.app',
    'Google Chrome Canary.app',
    'Firefox.app',
    'Sequel Pro.app'
  ]
end

dep 'Dropbox.app' do
  source 'https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%202.0.26.dmg'
end

dep 'Moom.app' do
  source 'http://manytricks.com/download/moom'
end

dep 'iTerm.app' do
  source 'http://www.iterm2.com/nightly/latest'
end

dep 'VirtualBox.installer' do
  source 'http://download.virtualbox.org/virtualbox/4.2.16/VirtualBox-4.2.16-86992-OSX.dmg'
  provides 'VirtualBox', 'VboxManage', 'VBoxHeadless'
end

dep 'iPhoto.appstore'
dep '1Password.appstore'

dep 'Google Chrome.app' do
 source 'https://dl.google.com/chrome/mac/stable/GoogleChrome.dmg'
end

dep 'GitHub.app' do
  source 'https://central.github.com/mac/latest'
end

dep 'Alfred.app' do
  source 'http://cachefly.alfredapp.com/Alfred_2.0.7_205.zip'
end

dep 'Arq.app' do
  source 'http://www.haystacksoftware.com/arq/Arq.zip'
end

dep 'Flux.app' do
  source 'https://justgetflux.com/mac/Flux.zip'
end

dep 'Google Chrome Canary.app' do
  source 'https://storage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg'
end

dep 'Spotify.app' do
  source 'http://download.spotify.com/Spotify.dmg'
end

dep 'Firefox.app' do
  source 'http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/24.0/mac/en-US/Firefox%2024.0.dmg'
end

dep 'Transmission.app' do
  source 'http://download.transmissionbt.com/files/Transmission-2.82.dmg'
end

dep 'Shiori.app' do
  source 'http://aki-null.net/shiori/release/Shiori_1.0.1.zip'
end

dep 'Geekbench.app' do
  source 'http://d34wv75roto0rl.cloudfront.net/Geekbench-3.0.2-Mac.zip'
end

dep 'ImageAlpha.app' do
  source 'http://pngmini.com/ImageAlpha1.3.5.tar.bz2'
end

dep 'ImageOptim.app' do
  source 'http://imageoptim.com/ImageOptim.tbz2'
end

dep 'VLC.app' do
  source 'http://get.videolan.org/vlc/2.0.8/macosx/vlc-2.0.8-intel64.dmg'
end

dep 'Airfoil.app' do
  source 'http://neutral.rogueamoeba.com/mirror/files/Airfoil.zip'
end

dep 'Sequel Pro.app' do
  source 'https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg'
end
