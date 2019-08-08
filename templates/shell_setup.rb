meta :shell_setup do
  template {
    met? {
      '/etc/shells'.p.grep(which(basename))
    }
    meet {
      log_shell(
        "Adding #{which(basename)} to /etc/shells",
        "echo #{which(basename)} >> /etc/shells",
        sudo: true,
      )
    }
  }
end

