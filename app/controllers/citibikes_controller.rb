class CitibikesController < ApplicationController

  def index
    if params[:search]
      @citibikes = Citibike.search(params[:search])
    else
      @citibikes = Citibike.all.order('date')
    end
  end

  def import
    Citibike.import(params[:citibike_file])
    redirect_to root_path, notice: "Citibike information imported."
  end

end
