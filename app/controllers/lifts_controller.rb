class LiftsController < ApplicationController
  def index
    @lifts = Lift.all
    @blackcomb_lifts = @lifts.slice(0, 15)
    @whistler_lifts = @lifts.drop(15)
  end

  def show
  end
end
