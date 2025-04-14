
# config/schedule.rb

# Use this file to easily define all of your cron jobs.

# Example:
# set :output, "log/cron.log"

# config/schedule.rb

# config/schedule.rb

set :environment, "development"

every 1.day, at: "6:28 pm" do
  command "/Users/shrajanya020/COMP-4882/spring2025_foodies_with_a_cause/lib/tasks/launch.sh"
end
