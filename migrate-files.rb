dep 'migration-prompt' do
  unless '~/Files'.p.exists?
    confirm(
      'Are there files to be migrated from an external source?',
      :default => 'n'
    ) do
      requires 'migrate-files'
    end
  end
end

dep 'migrate-files', :source, :dest do
  source.ask("Enter source").
    default("/Volumes/SuperDuper/Users/#{ENV['USER']}")
  dest.ask("Enter destination").
    default("/Users/#{ENV['USER']}")

  dirs = source.p.children.select do |dir|
    dir = dir.relative_path_from(source.p)
    confirm("Migrate #{dir}?", :default => 'n') do
      true
    end
  end

  confirm(
    "The following directories will be copied to #{dest}" \
    "with `rsync -avhP`:\n\n" \
    "    #{dirs.map {|d| d.relative_path_from(source.p).to_s + "\n    "}}\n" \
    "OK?"
  ) do
    puts shell "rsync -avhP #{dirs.map {|d| d.to_s + ' '}} #{dest}"
  end
end

