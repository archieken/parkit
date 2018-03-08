class SpacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


 def index
  if !current_user.nil?
    profile = Profile.find(current_user.profile.id)
    @profile = profile
    current_user.avatar = @profile.avatar
  end

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

     @markers = @spaces.map do |space|

      case space.price
        when 0..5
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519266/Pin_Copy_15_2x_1.png'}
        when 6..10
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519288/Pin_Copy_16_2x.png'}
        when 11..15
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519299/Pin_Copy_17_2x.png'}
        when 16..20
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519308/Pin_Copy_18_2x.png'}
        else
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519318/Pin_Copy_19_2x.png'}
      end


      {
        icon: icon,
        lat: space.latitude,
        lng: space.longitude,
        infoWindow: { content: render_to_string(partial: "/spaces/map_box", locals: { space: space }) }
      }
     end
   else

     spaces_not_null = Space.all.where.not(latitude: nil, longitude: nil)
     dist= params[:distance].to_i/1000
     @spaces = spaces_not_null.near(location, dist)


     @markers = @spaces.map do |space|




      case space.price
        when 0..5
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519266/Pin_Copy_15_2x_1.png'}
        when 6..10
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519288/Pin_Copy_16_2x.png'}
        when 11..15
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519299/Pin_Copy_17_2x.png'}
        when 16..20
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519308/Pin_Copy_18_2x.png'}
        else
          icon = {url: 'http://res.cloudinary.com/dat5wdshi/image/upload/c_scale,h_30,q_100/v1520519318/Pin_Copy_19_2x.png'}
      end
     {
        icon: icon,
        lat: space.latitude,
        lng: space.longitude,
        infoWindow: { content: render_to_string(partial: "/spaces/map_box", locals: { space: space }) }
      }
    end
  end
 end

 def new
   @space = Space.new
   profile = Profile.find(current_user.profile.id)
   @profile = profile
   current_user.avatar = @profile.avatar
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
