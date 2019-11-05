dep 'proj' do
  requires %w[
    proj-linked
  ]
end

dep 'proj-linked' do
  requires 'symlink'.with(
    source: "~/Library/Mobile Documents/com~apple~CloudDocs/dev/proj".p,
    target: "~/proj".p,
  )
end
