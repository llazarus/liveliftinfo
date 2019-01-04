class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def retrieve_lift_status(lift) 
    status = Status.where(lift_code: lift.lift_code).last.status.upcase

    if status == "O"
      "/status_icons/open.svg"
    elsif status == "H"
      "/status_icons/hold.svg"
    else
      "/status_icons/closed.svg"
    end
  end
  helper_method :retrieve_lift_status

  def string_to_date(string)
    DateTime.parse(string).strftime("%B %d, %Y")
  end
  helper_method :string_to_date

  def retrieve_lift_image(lift_type) 
    if lift_type == "T"
      "/assets/lift_icons/rope_tow.svg"
    elsif lift_type == "3"
      "/assets/lift_icons/three_p_chair.svg"
    elsif lift_type == "4"
      "/assets/lift_icons/four_p_chair.svg"
    elsif lift_type == "6"
      "/assets/lift_icons/six_p_chair.svg"
    else
      "/assets/lift_icons/gondola.svg"
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
      "background-color: #000000"
    end
  end
  helper_method :avalanche_background_color

  def retrieve_weather_image(weather_description)
    description = weather_description.downcase
    if description == "fairpartlycloudy" || description == "mostlysunny"
      "/assets/weather_icons/partly_cloudy.svg"
    elsif description == "sunny"
      "/assets/weather_icons/sunny.svg"
    elsif description == "cloudy" || description == "mostlycloudy"
      "/assets/weather_icons/cloudy.svg"
    elsif description == "rain"
      "/assets/weather_icons/rain.svg"
    elsif description == "showers"
      "/assets/weather_icons/rain_showers.svg"
    elsif description == "snowshowers"
      "/assets/weather_icons/snow_showers.svg"
    elsif description == "snow"
      "/assets/weather_icons/snow.svg"
    else
      "/assets/weather_icons/weather_generic.svg"
    end
  end
  helper_method :retrieve_weather_image

  def favorite_exists(lift_id, id)
    f = Favorite.where({favoritable_type: "Lift", favoritable_id: lift_id, favoritor_id: id })
    f.length > 0 ? true : false
  end
  helper_method :favorite_exists

  def alert_exists(lift_id, id)
    a = Favorite.where({favoritable_type: "Alert", favoritable_id: lift_id, favoritor_id: id })
    a.length > 0 ? true : false
  end
  helper_method :alert_exists

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
  end
end
