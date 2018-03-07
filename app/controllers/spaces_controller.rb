class SpacesController < ApplicationController


 def index
   location = params[:location]
     start_date = params[:start]
     #params[:start] = Date.today.to_s if start_date.blank?
     end_date = params[:end]
     #params[:end] = Date.today.to_s if end_date.blank?
     session[:start] = start_date
     session[:end] = end_date
     session[:location] = location
   if (location.blank?)
    raise
     @spaces = Space.where.not(latitude: nil, longitude: nil)
     @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
       marker.lat space.latitude
       marker.lng space.longitude
       marker.infowindow render_to_string(partial: "/spaces/map_box", locals: { space: space })
     end
   else
     spaces_not_null = Space.all.where.not(latitude: nil, longitude: nil)
     @spaces = spaces_not_null.near(location, params[:distance].to_i)

     #where("address ILIKE ?", "%#{location}%")
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
