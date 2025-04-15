

set :output, {
  standard: 'log/cron_log.log',
  error: 'log/cron_error_log.log'
}

set :environment, 'development'


every 1.minute do
  runner "MessageDigestJob.new.perform_now"
end
