USER = `whoami`.chomp
LIBRARY = "/Users/#{USER}/Library"

dep 'osx' do
  unless '~/Files'.p.exists?
    confirm(
      'Are there files to be migrated from an external source?',
      :default => 'n'
    ) do
      requires 'migrate files'
    end
  end

  requires 'apps'
  requires 'preferences'
  requires 'dropbox-backups'
end

dep 'dropbox-backups' do
  requires 'Messages.dropbox_backup'
end

dep 'Messages.dropbox_backup' do
  source "#{LIBRARY}/Containers/com.apple.iChat/Data/Library/Messages/Archive"
end
