class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def retrieve_lift_status(lift) 
    Status.where(lift_code: lift.lift_code).last.status
  end
  helper_method :retrieve_lift_status

  def string_to_date(string)
    DateTime.parse(string).strftime("%B %d, %Y")
  end
  helper_method :string_to_date

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
  end
end
