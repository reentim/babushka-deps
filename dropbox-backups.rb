dep 'dropbox-backups' do
  requires 'Messages.dropbox_backup'
end

dep 'Messages.dropbox_backup' do
  source "/Users/#{ENV['USER']}/Library/Containers/com.apple.iChat/Data/Library/Messages/Archive"
end
