# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# 
# Examples: http://github.com/javan/whenever
#  
### WHENEVER YOU ADD A JOB, IN TERMINAL RUN: "whenever --update-crontab" ###

# Set output of dev environment cron logs to "/Users/llazarus/Desktop/whenever_cron_log_d"
set :output, "~/Desktop/whenever_cron_log_d/mail.log"
# Set environment to development, CHANGE FOR PRODUCTION
set :environment, "development"

# Update lifts every minute between the hours of 06:00 and 18:00
every 1.minute do
  time = Time.now.strftime("%H:%M:%S")

  if time > "05:59:00" && time < "18:30:00"
    rake "update_lifts:update_lifts"
  end
end

# Default lift status to "X" at the beginning and end of each day
every 1.day, at: ['12:05 am', '11:55 pm'] do
  rake "reset_lifts:reset_lifts"
end

# Update AC Forecast every day at 06:00
every 1.day, at: '6:00 am' do
  rake "update_avalanche:update_avalanche"
end

# Update Weather Forecast every 2 hours
every 2.hours do
  rake "update_forecast:update_forecast"
end