dep "cloud" do
  requires "cloud-linked"
  requires "cloud-log-dir"
end

dep "cloud-linked" do
  requires "symlink".with(
    source: "~/Library/Mobile Documents/com~apple~CloudDocs".p,
    target: "~/cloud".p,
  )
end

dep "cloud-log-dir" do
  met? { "~/cloud/log".p.exists? }
  meet { "~/cloud/log".p.mkdir }
end
