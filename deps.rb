dep 'deps-linked' do
  link = '~/deps'.p
  source = '~/.babushka/sources/reentim'.p
  met? { File.symlink?(link) && File.readlink(link) == source }
  meet { File.symlink(source, link) }
end
