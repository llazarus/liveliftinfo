class WebcamsController < ApplicationController
  def index
    render "lifts/webcam_partials/_cam_collapse",
           layout: false
  end
end
