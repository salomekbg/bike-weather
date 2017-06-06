class WeathersController < ApplicationController

  def import
    Weather.import(params[:weather_file])
    redirect_to root_path, notice: "Weather information imported."
  end
  
end
