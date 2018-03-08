class ProfilesController < ApplicationController

  def show
    if current_user.profile.nil?
      new
    else
      profile = Profile.find(current_user.profile.id)
      @profile = profile
      current_user.avatar = @profile.avatar
      if current_user.fullname == ''
        current_user.fullname = @profile.first_name
      end
    end
  end

  def new
    @profile = Profile.new
    session[:return_to] ||= request.referer
  end

  def create
    profile = Profile.new(profile_params)
    profile.user_id = current_user.id
    if profile.save
      current_user.avatar = profile.avatar
      redirect_to session.delete(:return_to)
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(current_user.profile.id)
    current_user.avatar = @profile.avatar
    current_user.fullname = @profile.first_name
  end

  def update
    @profile = current_user.profile
    if Profile.update(profile_params)
      current_user.avatar = @profile.avatar
      current_user.fullname = @profile.first_name
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone, :description, :avatar)
  end

end
