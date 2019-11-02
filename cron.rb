dep 'cron' do
  requires %w[
  ]
end

dep 'minutely-date-log.cron' do
  at "* * * * *"
  run "date >> ~/cloud/cronlogs/mab-macbook-cron-date.log"
end
