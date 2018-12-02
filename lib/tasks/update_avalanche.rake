namespace :update_avalanche do
  desc "GET request to API. Persist new object in Avalanche table"
  task update_avalanche: :environment do
    puts "<<< Contacting external API: Avalanche Forecast >>>"
    response = HTTParty.get("https://www.avalanche.ca/api/forecasts/sea-to-sky.json")

    a = Avalanche.create(date_issued: response["dateIssued"],
                         valid_until: response["validUntil"],
                         highlights: response["highlights"],
                         confidence: response["confidence"],
                         danger_ratings: response["dangerRatings"])
    
    a.confidence.chomp(" - ")
    a.save

    puts "Updated Avalanche Forecast, id: #{a.id}"
    puts "<<< Update Complete: Avalanche Forecast >>>"
  end
end