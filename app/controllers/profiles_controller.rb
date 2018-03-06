class ProfilesController < ApplicationController

  before_action :find_user_id, only: [ :show, :create, :edit, :update ]

  def show
    @profile = Profile.find(params[:user_id])
  end

  def new
    @profile = Profile.new
    @profile.user_id = @user_id
  end

  def create
    profile =Profile.new(profile_params)
    profile.user_id = @user_id
    if profile.save
      redirect_to spaces_path
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:user_id])
  end

  def update
    @profile.user_id = @user_id
    if @profile =Profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  private

  def find_user_id
    @user_id = user.id
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone, :description, :avatar)
  end

end
