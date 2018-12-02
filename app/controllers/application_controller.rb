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

  def retrieve_lift_image(lift_type) 
    if lift_type == "T"
      "/assets/lift_icons/rope_tow.png"
    elsif lift_type == "3"
      "/assets/lift_icons/three_p_chair.png"
    elsif lift_type == "4"
      "/assets/lift_icons/four_p_chair.png"
    elsif lift_type == "6"
      "/assets/lift_icons/six_p_chair.png"
    else
      "/assets/lift_icons/gondola.png"
    end
  end
  helper_method :retrieve_lift_image

  def avalanche_background_color(danger_rating)
    if danger_rating == "1"
      "background-color: #7bb24b"
    elsif danger_rating == "2"
      "background-color: #ffed47"
    elsif danger_rating == "3"
      "background-color: #e39446"
    elsif danger_rating == "4"
      "background-color: #d65345"
    else
      "background-color: ##000000"
    end
  end
  helper_method :avalanche_background_color

  def retrieve_weather_image(weather_description)
    description = weather_description.downcase
    if description == "fairpartlycloudy" || description == "mostlysunny"
      "/assets/weather_icons/partly_cloudy.png"
    elsif description == "sunny"
      "/assets/weather_icons/sunny.png"
    elsif description == "cloudy" || description == "mostlycloudy"
      "/assets/weather_icons/cloudy.png"
    elsif description == "rain"
      "/assets/weather_icons/rain.png"
    elsif description == "showers"
      "/assets/weather_icons/rain_showers.png"
    elsif description == "snowshowers"
      "/assets/weather_icons/snow_showers.png"
    elsif description == "snow"
      "/assets/weather_icons/snow.png"
    else
      "/assets/weather_icons/weather_generic.png"
    end
  end
  helper_method :retrieve_weather_image

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
  end
end
