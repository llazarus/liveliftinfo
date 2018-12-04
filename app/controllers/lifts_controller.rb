class LiftsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :find_favorite, only: [ :favorite ]
  before_action :find_alert, only: [ :alert ]
  respond_to :js, :json, :html


  def index
    @lifts = Lift.all
    @blackcomb_lifts = @lifts.slice(0, 15)
    @whistler_lifts = @lifts.drop(15)
    @weather = Forecast.last
    @avalanche = Avalanche.last
  end

  def favorite
    if !current_user.favorited? @lift
      current_user.favorite @lift
    elsif current_user.favorited? @lift
      current_user.remove_favorite @lift
    end    
  end

  def alert
    if !current_user.favorited? @alert
      current_user.favorite @alert
    else
      current_user.remove_favorite @alert
    end 
  end

  private
  def find_favorite
    @lift = Lift.find_by(lift_code: params[:id])
  end

  def find_alert
    @alert = Alert.find_by(lift_code: params[:id])
  end
end
