namespace :update_forecast do
  desc "GET request to API. Persist new object in Forecast table"
  task update_forecast: :environment do
    puts "<<< Contacting API: Weather Forecast >>>"
    response = HTTParty.get("http://www.epicmix.com/vailresorts/sites/epicmix/api/mobile/weather.ashx")
    
    response_shortcut = response["snowconditions"][10]
    f = Forecast.create(new_snow_i: response_shortcut["newSnow"],
                        two_days_i: response_shortcut["last48Hours"],
                        seven_days_i: response_shortcut["last7Days"],
                        snowpack_i: response_shortcut["midMountainBase"],
                        forecast: response_shortcut["weatherForecast"])
    
    puts "Updated Weather Forecast, id: #{f.id}"
    puts "<<< Update Complete: Weather Forecast >>>"
  end
end