dep 'scripts' do
  met? { '~/bin/README.md'.p.exists? }
  meet {
    git 'git@github.com:reentim/scripts.git', :to => '~/bin'
  }
end

