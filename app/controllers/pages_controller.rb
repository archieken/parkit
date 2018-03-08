class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]
  def home
    profile = Profile.find(current_user.profile.id)
    @profile = profile
    current_user.avatar = @profile.avatar
  end

  def about
    profile = Profile.find(current_user.profile.id)
    @profile = profile
    current_user.avatar = @profile.avatar
  end
end
