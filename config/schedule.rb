
set :output, {
  standard: 'log/cron_log.log',
  error: 'log/cron_error_log.log'
}

set :environment, 'development'


every 1.day, at: '2:18 pm' do
  # command "cd #{path} && bin/rails runner 'MessageDigestJob.perform_now'"
  command "cd #{path} && /Users/shrajanya020/.local/bin/mise exec -- bundle exec rails runner 'MessageDigestJob.perform_now'"
end
