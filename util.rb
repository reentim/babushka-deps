dep 'symlink', :source, :target do
  met? { target.p.readlink == source.p }
  meet {
    log "Linking #{source} to #{target}"
    target.p.make_symlink(source.p)
  }
end
