dep 'ubuntu-rails' do
  requires %w[
    git-core.managed curl.managed zlib1g-dev.managed build-essential.managed
    libssl-dev.managed libreadline-dev.managed libyaml-dev.managed
    libsqlite3-dev.managed sqlite3.managed libxml2-dev.managed libxslt1-dev.managed
    libcurl4-openssl-dev.managed python-software-properties.managed
    libffi-dev.managed nodejs.managed
  ]
  requires 'ruby'
  requires 'bundler.gem'
  requires 'node-ubuntu'
  requires 'rails.gem'
  requires 'postgres-ubuntu'
end

dep 'postgres-ubuntu' do
  requires 'postgres-ubuntu-apt-sources'
  requires %w[postgresql-common.managed postgresql-9.5.managed libpq-dev.managed]
  requires 'postgres-user'
end

dep 'postgres-user' do
  met? { shell %q[sudo -u postgres psql -c '\du' | grep `whoami`] }
  meet { shell %q[sudo -u postgres createuser `whoami` -s] }
end

dep 'postgres-ubuntu-apt-sources' do
  met? { "/etc/apt/sources.list.d/pgdg.list".p.grep(/postgresql/) }
  meet {
    shell %Q[echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list], sudo: true
    shell %Q[wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -], sudo: true
    shell "apt-get update", sudo: true
  }
end

dep 'curl.managed'
dep 'nodejs.managed'
dep 'sqlite3.managed'

dep 'build-essential.managed'            do provides [] end
dep 'git-core.managed'                   do provides [] end
dep 'libcurl4-openssl-dev.managed'       do provides [] end
dep 'libffi-dev.managed'                 do provides [] end
dep 'libreadline-dev.managed'            do provides [] end
dep 'libsqlite3-dev.managed'             do provides [] end
dep 'libssl-dev.managed'                 do provides [] end
dep 'libxml2-dev.managed'                do provides [] end
dep 'libxslt1-dev.managed'               do provides [] end
dep 'libyaml-dev.managed'                do provides [] end
dep 'python-software-properties.managed' do provides [] end
dep 'zlib1g-dev.managed'                 do provides [] end

dep 'postgresql-9.5.managed'    do provides [] end
dep 'postgresql-common.managed' do provides [] end
dep 'libpq-dev.managed'         do provides [] end
