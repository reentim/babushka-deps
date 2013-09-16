meta :npm do
  def npm
    name.split('.').first
  end
  template {
    met? { which npm }
    meet { log_shell "Installing #{npm}", "npm install -g #{npm}" }
  }
end
