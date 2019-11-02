dep 'cloud' do
  requires 'symlink'.with(
    source: "~/Library/Mobile Documents/com~apple~CloudDocs".p,
    target: "~/cloud",
  )
end
