class Status < ApplicationRecord
  after_create :send_alerts

  private
  def send_alerts
    if self.status.upcase == "O"
      lift_id = Lift.where(lift_code: self.lift_code).first.id
      
      SendLiftAlertJob.perform_later(lift_id)
    end 
  end

end
