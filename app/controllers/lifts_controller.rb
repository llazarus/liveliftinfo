class LiftsController < ApplicationController
  def index
    @lifts = Lift.all
  end

  def show
  end
end
