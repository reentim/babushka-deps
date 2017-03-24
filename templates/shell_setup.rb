meta :shell_setup do
  template {
    met? { '/etc/shells'.p.grep(which(basename)) }
    meet { which(basename).p.append('/etc/shells') }
  }
end

