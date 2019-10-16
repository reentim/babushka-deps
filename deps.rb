dep 'deps-linked' do
  requires 'symlink'.with(
    source: '~/.babushka/sources/reentim'.p,
    target: '~/deps'.p,
  )
end

dep 'sources-linked-to-deps' do
  link = "~/.babushka/deps".p
  source = "~/.babushka/sources/reentim".p
  met? { link.readlink == source.to_s }
  meet {
    log "Linking #{source} to #{link}"
    link.rm if link.exists? && link.empty?
    link.make_symlink(source)
  }
end
