dep 'linux-vm' do
  requires 'dotfiles'.with(:install_ssh_socket_hack)
  requires 'scripts'
  requires 'tools'
end
