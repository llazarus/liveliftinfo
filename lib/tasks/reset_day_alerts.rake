namespace :reset_day_alerts do
  desc "Run at the very end of each day (23:55). Delete every row from Favorite table with favoritable_type == 'Alert' so users aren't sent old alerts they have forgotten about"
  task reset_day_alerts: :environment do
    puts "<<< Resetting Favorite: Alerts For Day At #{Time.now.strftime("%H:%M:%S")} >>>"

    Favorite.where(favoritable_type: "Alert").delete_all

    puts "<<< Favorite: Alerts Reset For Day >>>"
  end
end