class WelcomeController < ApplicationController

  def index
    if params[:search]
      @date = params[:search]
      @citibikes = Citibike.search(@date)
      @weathers = Weather.search(@date)
    end
    render 'index'
  end

end
