namespace :reset_day_lifts do
  desc "Run at the very beginning and end of each day (00:05 && 23:55). Set status of each lift to 'X' to ensure at least two values are created on each day"
  task reset_day_lifts: :environment do
    puts "<<< Contacting API: Lifts (Daily Reset) At #{Time.now.strftime("%H:%M:%S")} >>>"
    response = HTTParty.get("http://www.epicmix.com/vailresorts/sites/epicmix/api/mobile/lifts.ashx")

    wb_lifts = Array(244..272)
    wb_lifts.each do |lift|
      response_shortcut = response["lifts"][lift]

      if response_shortcut["resortID"] == 13
        Status.create(lift_code: response_shortcut["liftID"],
                      name: response_shortcut["liftName"],
                      status: "X")
        puts "Reset status of #{response_shortcut["liftName"]}!"
      end
    end
    puts "<<< Reset Complete: Lifts >>>"
  end 
end