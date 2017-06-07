class WelcomeController < ApplicationController
  require 'byebug'

  def index
    if params[:search]
      @citibikes = Citibike.search(params[:search])
      @weathers = Weather.search(params[:search])
    end
    render 'index'
  end

end
