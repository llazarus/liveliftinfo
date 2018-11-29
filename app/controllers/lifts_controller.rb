class LiftsController < ApplicationController
  def index
    @lifts = Lift.all
    @blackcomb_lifts = @lifts.slice(0, 15)
    @whistler_lifts = @lifts.drop(15)
    @weather = Forecast.last
    @avalanche = Avalanche.last
  end

  def show
  end
end
