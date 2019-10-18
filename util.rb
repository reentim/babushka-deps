dep 'symlink', :source, :target do
  met? { target.p.readlink == source.p }
  meet {
    log "Linking #{source} to #{target}"
    target.p.make_symlink(source.p)
  }
end

dep 'repo-pulled-since', :repo, :time do
  time.default!(Time.now.to_i)

  requires 'repo-fetched-since'.with(repo: repo, time: time)

  # TODO really understand how params actually work, and how I can just access
  # the time object

  met? {
    head_moved_at = %x[stat -c %Y #{repo.p}/.git/HEAD].to_i
    head_moved_at > time.to_s.to_i
  }

  meet {
    %x[git --git-dir #{repo.p}/.git merge --ff-only]
  }
end

dep 'repo-fetched-since', :repo, :time do
  met? {
    last_fetched_at = %x[stat -c %Y #{repo.p}/.git/FETCH_HEAD].to_i
    last_fetched_at > time.to_s.to_i
  }

  meet {
    log_shell("Fetching #{repo.p}", "git --git-dir #{repo.p}/.git fetch")
  }
end
