dep 'deps' do
  requires %w[
    deps-linked
    sources-linked-to-deps
  ]
end

dep 'deps-linked' do
  requires 'symlink'.with(
    source: '~/.babushka/sources/reentim'.p,
    target: '~/deps'.p,
  )
end

dep 'sources-linked-to-deps' do
  requires 'symlink'.with(
    source: "~/.babushka/sources/reentim".p,
    target: "~/.babushka/deps".p,
  )
end
