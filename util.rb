dep 'symlink', :source, :target do
  met? { target.p.readlink == source.to_s }
  meet {
    log "Linking #{source} to #{target}"
    target.p.rm if target.p.exists? && target.p.empty?
    target.p.make_symlink(source)
  }
end
