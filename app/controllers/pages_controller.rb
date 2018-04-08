class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :create_subscription]
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
    subscription = Subscription.new
  end

  def create_subscription
    if !subscription_params.nil?
      @subscription = Subscription.new
      @subscription = Subscription.create(subscription_params)
      if @subscription.save
        # flash[:create_subscription] = "Order has been added to your basket."
        redirect_to about_path
      else
        render :about
      end
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
