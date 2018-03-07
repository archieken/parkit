class SpacesController < ApplicationController


 def index
    location = params[:location]
     start_date = params[:start]
     end_date = params[:end]
     start_date = Date.today if start_date.blank?
     end_date = Date.today if end_date.blank?
     session[:start] = start_date
     session[:end] = end_date
     session[:location] = location
   if (location.blank?)
     @spaces = Space.where.not(latitude: nil, longitude: nil)
     @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
       marker.lat space.latitude
       marker.lng space.longitude
       marker.infowindow render_to_string(partial: "/spaces/map_box", locals: { space: space })
     end
   else
     spaces_not_null = Space.all.where.not(latitude: nil, longitude: nil)
     @spaces = spaces_not_null.near(location, params[:distance].to_i)

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


  def destroy
    Space.destroy(params[:id])
    redirect_to spaces_path
  end

  private

  def space_params
    params.require(:space).permit(:address, :price, :parking_type, :photo)
  end
end
