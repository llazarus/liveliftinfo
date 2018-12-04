class Status < ApplicationRecord
  after_create :send_alerts

  private
  def send_alerts
    if self.status.upcase == "O"
      # Find Lift by lift_code and return ID
      lift_id = Lift.where(lift_code: self.lift_code).ids
      
      # Find all favoriter_ids where favoriteable_type == "Alert" and favortiable_id == id from above
      users_to_alert = Favorite.where({favoritable_type: "Alert", favoritable_id: lift_id})

      users_to_alert.each do |user|
        puts "User id:#{user.favoritor_id}!!!!! To alert!!!!!"
        # Send message to each user as delayed_job

        # Delete all relevant user rows from Favorites table
        Favorite.where({favoritor_id: user.favoritor_id, favoritable_id: lift_id}).first.delete
      end
    end 
  end
end
