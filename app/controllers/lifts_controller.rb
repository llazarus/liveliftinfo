class LiftsController < ApplicationController
  before_action :authenticate_user!, only: [ :favorite_lift, :alert_lift ]
  before_action :find_lift, only: [ :favorite_lift ]
  before_action :find_alert, only: [ :alert_lift ]
  respond_to :js, :json, :html


  def index
    @lifts = Lift.all
    @blackcomb_lifts = @lifts.slice(0, 15)
    @whistler_lifts = @lifts.drop(15)
    @weather = Forecast.last
    @avalanche = Avalanche.last
    @history = Status.where("created_at::date > ?", (Date.today - 7))
    @favorites = Favorite.where({favoritable_type: "Lift", favoriter_id: current_user.id})
  end

  def favorite_lift
    if !current_user.favorited? @lift
      current_user.favorite @lift
    elsif current_user.favorited? @lift
      current_user.remove_favorite @lift
    end    
  end

  def alert_lift
    if !current_user.favorited? @alert
      current_user.favorite @alert
    elsif current_user.favorited? @alert
      current_user.remove_favorite @alert
    end    
  end

  private
  def find_lift
    @lift = Lift.find_by(id: params[:id])
  end

  def find_alert
    @alert = Alert.find_by(id: params[:id])
  end
end
