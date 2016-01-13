dep 'current-projects' do
  requires %w[
    project_nett
  ]
end

# namespace idea

dep 'project_nett' do
  met? { "#{ENV['HOME']}/Development/Projects/nett".p.exists? }
  meet { shell "git clone 'git@bitbucket.org:nettapp/nett.git' #{ENV['HOME']}/Development/Projects/nett" }
end
