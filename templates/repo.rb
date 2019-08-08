meta :repo do
  accepts_value_for :source
  accepts_value_for :target

  template {
    met? { File.exists?(File.join(target, '.git')) }
    meet { git source, to: target }
  }
end
