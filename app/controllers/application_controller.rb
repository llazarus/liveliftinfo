class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def retrieve_lift_status(lift)
    code = lift.lift_code
     return Status.where(lift_code: code)
  end
  helper_method :retrieve_lift_status

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
  end
end
