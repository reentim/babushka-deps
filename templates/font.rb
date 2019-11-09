meta :font do
  accepts_list_for :source
  accepts_list_for :provides

  def family_dir
    "~/Library/Fonts/#{basename}".p
  end

  def installed_path(file)
    File.join(family_dir, file).p
  end

  template {
    met? {
      provides.all? { |file| installed_path(file).exists? }
    }

    meet {
      # Babushka::Resource.download doesn't seem to keep up with redirects from
      # AWS-hosted GitHub releases assets, so curl with -L instead:
      source.each { |url|
        in_download_dir {
          filename = url.p.basename
          cmd = "curl -L #{url} -o #{filename}"
          log_shell cmd, cmd unless filename.p.exists?

          Babushka::Asset.for(filename).extract {
            to_install = Dir.glob("**/**")
              .select { |path| provides.include?(File.basename(path)) }
              .reject { |path| installed_path(File.basename(path)).exists? }

            return if to_install.empty?

            log_shell(
              "Created #{family_dir}",
              "mkdir -p #{family_dir}"
            ) unless family_dir.dir?

            log "Copying to #{family_dir}..."

            to_install.each { |path|
              path.p.copy(installed_path(File.basename(path)))
              log path.rjust(path.length + 2)
            }
          }
        }
      }
    }
  }
end
