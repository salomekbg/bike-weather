class CitibikesController < ApplicationController

  def import
    Citibike.import(params[:citibike_file])
    redirect_to root_path, notice: "Citibike information imported."
  end
  
end
