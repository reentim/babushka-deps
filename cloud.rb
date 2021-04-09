dep "cloud" do
  requires "cloud-linked"
end

dep "cloud-linked" do
  requires "symlink".with(
    source: "~/Library/Mobile Documents/com~apple~CloudDocs".p,
    target: "~/iCloud-Drive".p,
  )
end
