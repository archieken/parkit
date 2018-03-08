class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]
  def home
    if current_user
      if current_user.profile
        profile = Profile.find(current_user.profile.id)
        @profile = profile
        current_user.avatar = @profile.avatar
      end
    end
  end

  def about

  end
end
