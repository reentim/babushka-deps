# TODO
# dotfiles repo:
# git submodule init
# git submodule update
# if master behind origin/master and ff-able, ff and attempt rebase of branch onto it
#
# update submodules from their remotes, commit to modules/next branch
# have edge branch which is all the branches that will rebase onto master together, so rebased

dep 'dep-sources' do
  requires 'private-deps.repo'
  requires 'deps-pushable'
end

dep 'private-deps.repo' do
  requires 'bitbucket-authentication'

  source 'git@bitbucket.org:reentim/private-babushka-deps.git'
  target File.join(Dir.home, '.babushka', 'sources', 'private')
end

dep 'deps-pushable' do
  requires 'github-authentication'

  met? {
    cd File.join(Dir.home, '.babushka', 'sources', 'reentim') do
      shell? 'git remote -v | grep -v https'
    end
  }
  meet {
    cd File.join(Dir.home, '.babushka', 'sources', 'reentim') do
      shell "git remote set-url origin git@github.com:reentim/babushka-deps.git"
    end
  }
end

dep 'github-authentication' do
  requires 'ssh-authentication'.with(user: 'git', domain: 'github.com')
end

dep 'bitbucket-authentication' do
  requires 'ssh-authentication'.with(user: 'git', domain: 'bitbucket.com')
end

dep 'ssh-authentication', :user, :domain do
  met? { !%x[ssh -T #{user}@#{domain} 2>&1].include? 'Permission denied' }
  meet { unmeetable! "ssh key for #{domain} not in place?" }
end

