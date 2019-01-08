class SendLiftAlertJob < ApplicationJob
  queue_as :default

  def perform(lift_id)
    users_to_alert = Favorite.where({favoritable_type: "Alert", favoritable_id: lift_id})
    
    lift_name = Lift.find(lift_id).name

    if users_to_alert.length > 0
      users_to_alert.each do |user|
      notify_user = User.find(user.favoritor_id)

      # Send SMS to user
      sms = Aws::SNS::Client.new(
        region: ENV["AWS_REGION"],
        access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"])

      sms.publish(phone_number: notify_user.phone, 
                  message: "#{lift_name} is open! Full site: www.liveliftinfo.com")

      # Delete all user row from Favorite table
      Favorite.where({favoritor_id: user.favoritor_id, favoritable_id: lift_id}).first.delete
      end

      puts "<<< Sent SMS Alerts For #{lift_name} >>> \n\n"
    end

    puts "<<< No SMS Alerts Sent For #{lift_name} >>> \n\n"
  end
end
