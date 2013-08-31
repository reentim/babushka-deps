dep 'linux-vm' do
  requires 'dotfiles'.with('ssh_socket')
  requires 'scripts'
  requires 'tools'
end
