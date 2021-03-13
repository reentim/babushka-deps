dep '1Password 7.installer' do
  source 'https://app-updates.agilebits.com/download/OPM7'
  provides '1Password 7.app'

  # babushka looks for "1Password-7.app"
  met? { "/Applications/1Password\ 7.app".p.exists? }
end

dep 'Alfred.app' do
  source 'https://cachefly.alfredapp.com/Alfred_4.3.2_1221.dmg'
end

dep 'Arq.app' do
  source 'http://www.haystacksoftware.com/arq/Arq.zip'
end

dep 'Firefox.app' do
  source 'http://download-origin.cdn.mozilla.net/pub/firefox/releases/68.0.1/mac/en-US/Firefox%2068.0.1.dmg'
end

dep 'Google Chrome Canary.app' do
  source 'https://storage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg'
end

dep 'Google Chrome.app' do
  source 'https://dl.google.com/chrome/mac/stable/GoogleChrome.dmg'
end

dep 'ImageAlpha.app' do
  source 'https://pngmini.com/ImageAlpha1.5.1.tar.bz2'
end

dep 'ImageOptim.app' do
  source 'https://imageoptim.com/ImageOptim.tbz2'
end

dep 'Moom.app' do
  source 'https://manytricks.com/download/moom/'
end

dep 'Transmission.app' do
  source 'http://download.transmissionbt.com/files/Transmission-2.82.dmg'
end

dep 'VLC.app' do
  source 'http://get.videolan.org/vlc/2.2.1/macosx/vlc-2.2.1.dmg'
end

dep 'VirtualBox.installer' do
  source 'https://download.virtualbox.org/virtualbox/6.0.10/VirtualBox-6.0.10-132072-OSX.dmg'
  provides 'VirtualBox', 'VboxManage', 'VBoxHeadless'
end

dep 'iTerm.app' do
  source 'https://iterm2.com/downloads/stable/latest'
  provides 'iTerm.app >= 3.0'
end

dep 'Docker.app' do
  source 'https://download.docker.com/mac/stable/Docker.dmg'
end

dep 'Time Sink.app' do
  source 'https://manytricks.com/download/_do_not_hotlink_/timesink200.dmg'
end

dep 'Spillo.app' do
  source 'https://bananafishsoftware.com/products/spillo/direct/'
end

dep 'Shiori.app' do
  source 'http://aki-null.net/shiori/release/Shiori_1.0.1.zip'
end

dep 'Slack.app' do
  source 'https://slack.com/ssb/download-osx'
end

dep 'vagrant.installer' do
  requires 'VirtualBox.installer'
  source 'https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.dmg'
end

dep 'Dash.app' do
  source 'https://sanfrancisco.kapeli.com/downloads/v6/Dash.zip'

  # babushka looks for Dash*.app, which is met by Dashboard.app
  met? { "/Applications/Dash.app".p.exists? }
end

dep 'Visual Studio Code.app' do
  source 'https://update.code.visualstudio.com/latest/darwin/stable'
end
