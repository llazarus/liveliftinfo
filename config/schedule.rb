require "tzinfo"
### WHENEVER YOU ADD A JOB, IN TERMINAL RUN: "whenever --update-crontab" ###

def local(time)
  TZInfo::Timezone.get("America/Vancouver").local_to_utc(Time.parse(time))
end

# Set environment to development, CHANGE FOR PRODUCTION
set :environment, "production"

# UNCOMMENT BELOW THIS LINE!!!

# Update lifts every minute between the hours of 06:00 and 18:30
every 1.minute do
  rake "update_lifts:update_lifts"
end

# Default lift status to "X" at the beginning and end of each day
every 1.day, at: [local('12:05 am'), local('11:55 pm')] do
  rake "reset_day_lifts:reset_day_lifts"
end

# Delete_all Favorites with favoritable_type = "Alert" at the end of each day
every 1.day, at: local('11:55 pm') do
  rake "reset_day_alerts:reset_day_alerts"
end

# Update AC Forecast every day at 06:00 and 11:30
every 1.day, at: [local('6:00 am'), local('11:30 am')] do
  rake "update_avalanche:update_avalanche"
end

# Update Weather Forecast every 2 hours
every 2.hours do
  rake "update_forecast:update_forecast"
end