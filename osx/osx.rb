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
  requires 'other data backed up'
end

dep 'other data backed up' do
  requires 'Messages.backed_up'
end

dep 'Messages.backed_up' do
  source "#{LIBRARY}/Messages/Archive"
end
