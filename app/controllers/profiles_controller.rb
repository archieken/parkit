class ProfilesController < ApplicationController

  before_action :find_user_id, only: [ :show, :create, :edit, :update ]

  def show
    profile = Profile.find(current_user.id)
    if profile.nil?
      new
    else
      @profile = profile
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    profile =Profile.new(profile_params)
    profile.user_id = current_user.id
    if profile.save
      redirect_to spaces_path
    else
      render :new
    end
  end

  def edit
    profile = Profile.find(current_user.id)
  end

  def update
    @profile.user_id = current_user.id
    if @profile =Profile.update(profile_params)
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
