class SpacesController < ApplicationController


 def index
   location = params[:location]
     # start = params[:start]
     # end = params[:end]
   if (location.blank?)
     @spaces = Space.where.not(latitude: nil, longitude: nil)
     @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
       marker.lat space.latitude
       marker.lng space.longitude
       marker.infowindow render_to_string(partial: "/spaces/map_box", locals: { space: space })
     end
   else
     space_not_null = Space.all.where.not(latitude: nil, longitude: nil)
     @spaces = space_not_null.all.where("address ILIKE ?", location)
     @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
       marker.lat space.latitude
       marker.lng space.longitude
       marker.infowindow render_to_string(partial: "/spaces/map_box", locals: { space: space })
    end
  end
 end

 def new
   @space = Space.new
 end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    if @space.save
      redirect_to spaces_path
    else
      render 'new'
    end
  end

  private

  def space_params
    params.require(:space).permit(:address, :price, :parking_type, :photo)
  end
end
