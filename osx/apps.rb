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
    'Geekbench.app'
  ]
end

dep 'dev apps' do
  requires [
    'VirtualBox.installer',
    'iTerm.app',
    'GitHub.app',
    'Google Chrome Canary.app',
    'Firefox.app',
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
  source 'http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/firefox-26.0a1.en-US.mac.dmg'
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
