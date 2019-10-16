dep 'libraries' do
  lib = "~/lib".p

  met? {
    Dir.glob("#{lib}/*").map(&:p).select(&:directory?).all? { |path|
      filepath = "#{path}/#{path.basename}.rb".p
      !filepath.exists? || "#{lib}/#{path.basename}.rb".p.readlink == filepath
    } && \
    Dir.glob("#{lib}/*.rb").map(&:p).all?(&:symlink?)
  }

  meet {
    Dir.glob("#{lib}/*.rb").map(&:p).map { |path|
      filename = path.basename
      new_dir = "#{lib}/#{filename.sub(/\.rb$/, '')}"
      new_path = File.join(new_dir, filename)
      unless path.symlink?
        temp_file = path.mv(path.to_s + ".temp")
        Dir.mkdir(new_dir) unless File.directory?(new_dir)
        temp_file.p.mv(new_path)
        File.symlink(new_path, File.join(lib, filename))
        log format("Moving %s to directory", filename)
      end
    }

    Dir.glob("#{lib}/*").map(&:p).select(&:directory?).map { |dir|
      filename = File.basename(dir) + ".rb"
      source = File.join(dir, filename).p
      link = File.join(lib, filename).p
      next if !source.exists? || File.symlink?(link)
      File.symlink(link, link)
      log "Linking #{filename} to ~/lib/"
    }
  }
end
