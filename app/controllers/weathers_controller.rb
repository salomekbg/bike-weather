class WeathersController < ApplicationController

  def index
    @weathers = Weather.all.order('date')
  end

  def import
    Weather.import(params[:weather_file])
    redirect_to root_path, notice: "Weather information imported."
  end

  def destroy
    Weather.delete
    render 'index'
  end
end
