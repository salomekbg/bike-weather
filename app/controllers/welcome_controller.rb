class WelcomeController < ApplicationController

  def index
    @citibikes = Citibike.all
    @weathers = Weather.all
  end

end
