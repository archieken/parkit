class SpacesController < ApplicationController


  def index

  @spaces = Space.where.not(latitude: nil, longitude: nil)
  @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
      marker.lat space.latitude
      marker.lng space.longitude
      marker.infowindow render_to_string(partial: "/spaces/map_box", locals: { space: space })
    end

  # location = params[:location]
  # start = params[:start]
  # end = params[:end]

  # @spaces = Space.all.where(:location = location)

  end



end
