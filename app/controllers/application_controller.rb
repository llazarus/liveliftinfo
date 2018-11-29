class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def retrieve_lift_status(lift)
    code = lift.lift_code
    Status.where(lift_code: code).last.status
  end
  helper_method :retrieve_lift_status

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
  end
end
