namespace :reset_day_alerts do
  desc "Run at the very end of each day (23:55). Delete every row from Favorite table with favoritable_type == 'Alert' created over a week ago so users aren't sent old alerts they have forgotten about"
  task reset_day_alerts: :environment do
    puts "<<< Resetting Favorite: Alerts For Past Week At #{Time.now.strftime("%H:%M:%S")} >>>"

    Favorite.where(["favoritable_type = :type and created_at < :one_week_ago", { type: "Alert", one_week_ago: "#{Time.now - 7.days}" }]).delete_all

    puts "<<< Favorite: Alerts Reset For Past Week >>>"
  end
end