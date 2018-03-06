class SpacesController < ApplicationController


  def index


  location = params[:location]
  # start = params[:start]
  # end = params[:end]


  if params[:location].empty?
    @spaces = Space.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
    marker.lat space.latitude
    marker.lng space.longitude
    marker.infowindow render_to_string(partial: "/spaces/map_box", locals: { space: space })
    end
  end
  else
    space_not_null = Space.all.where.not(latitude: nil, longitude: nil)
    @spaces = space_not_null.all.where(address: location)
    @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
    marker.lat space.latitude
    marker.lng space.longitude
    marker.infowindow render_to_string(partial: "/spaces/map_box", locals: { space: space })
  end

  end


end
