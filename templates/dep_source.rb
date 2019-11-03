meta :dep_source do
  template {
    name = dependency.basename
    requires 'repo'.with(
      source: "git@github.com:#{name}/babushka-deps.git",
      target: "~/.babushka/sources/#{name}",
    )
  }
end
