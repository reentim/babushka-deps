dep 'node' do
    requires [
      'node.managed',
      'npm'
    ]
end

dep 'node.managed'

dep 'npm' do
  requires 'node.managed'

  met? { in_path? 'npm' }
  meet {
    shell 'curl http://npmjs.org/install.sh | sh'
  }
end

