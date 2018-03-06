class SpacesController < ApplicationController


  def index()

  location = params[:location]
  start = params[:start]
  end = params[:end]

  @spaces = Space.all.where(:location = location)

  end



end
