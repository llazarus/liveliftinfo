namespace :update_lifts do
  desc "Call API. Persist in Statuses table if lift status has changed since the last API call"
  task update_lifts: :environment do
    time = Time.now.strftime("%H:%M:%S")
    
    if time > "05:59:00" && time < "18:30:00"
      puts "<<< Contacting API: Lifts At #{Time.now.strftime("%H:%M:%S")} >>>"
      response = HTTParty.get("http://www.epicmix.com/vailresorts/sites/epicmix/api/mobile/lifts.ashx")
  
      # wb_lifts is an array containing all relevant indexes of the returned "lifts" object
      wb_lifts = Array(242..272)
  
      wb_lifts.each do |lift|
        response_shortcut = response["lifts"][lift]
        code_check = response_shortcut["liftID"]
        db_query_shortcut = Status.where(lift_code: code_check)
  
        if response_shortcut["resortID"] == 13
          if db_query_shortcut == []
            # Persist a new Status object if none already exist for comparison
            Status.create(lift_code: response_shortcut["liftID"],
                          name: response_shortcut["liftName"],
                          status: response_shortcut["status"])
            puts "Created new lift: #{response_shortcut["liftName"]}!"
          elsif db_query_shortcut.last["status"] != response_shortcut["status"]
            # Persist a new Status object if the given lift's "status" has changed.
            Status.create(lift_code: response_shortcut["liftID"],
                          name: response_shortcut["liftName"],
                          status: response_shortcut["status"])
            puts "Updated lift: #{response_shortcut["liftName"]}!"
          else
            # Do nothing if given lift's "status" value unchanged
            puts "No update needed: #{db_query_shortcut.last["name"]}!"
          end
        end
      end
      puts "<<< Update Complete: Lifts >>>"
    end
  end
end