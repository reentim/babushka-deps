meta :dropbox_backup do
  accepts_list_for :source

  def dropbox_shadow(file)
    file.sub /(#{USER})\//, '\1/Dropbox/.Backup/'
  end

  def link_map
    source.map do |s|
      { s => dropbox_shadow(s) }
    end
  end

  def unlinked
    link_map.map do |pair|
      pair.reject { |s, t| FileTest.symlink?(t) && File.readlink(t) == s }
    end.reject { |p| p.empty? }
  end

  def ensure_dirs_exist
    unlinked.each do |pair|
      pair.each do |s, t|
        target_parent = File.expand_path('..', t)
        if !target_parent.p.directory?
          log_shell "Creating matching directory in Dropbox/.Backup/", "mkdir -p #{target_parent}"
        end
      end
    end
  end

  def link
    ensure_dirs_exist

    unlinked.each do |pair|
      pair.each do |s, t|
        if t.p.exists?
          unmeetable! "Link alreday exists. Consider deleting it."
        else
          # TODO escape spaces in path
          log_shell "Linking #{t} to #{s}", "ln -s #{s} #{t}"
        end
      end
    end
  end

  template {
    met? {
      unlinked.empty?
    }
    meet {
      link
    }
  }
end
