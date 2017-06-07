class WelcomeController < ApplicationController
  require 'byebug'

  def index
    if params[:search]
      @date = params[:search]
      @citibikes = Citibike.search(@date)
      @weathers = Weather.search(@date)
    end
    render 'index'
  end

  def show
    @citibikes = Citibike.all.order('date')
    @weathers = Weather.all.order('date').where(tmax: -50..150, date: "04/01/2017".."05/31/3017")
    @min_temps = @weathers.map {|weather| [weather.date, weather.tmin]}
    @max_temps = @weathers.map {|weather| [weather.date, weather.tmax]}
    @trips = @citibikes.map {|citibike| [citibike.date, citibike.trips]}
    @miles = @citibikes.map {|citibike| [citibike.date, citibike.miles]}
  end

end
