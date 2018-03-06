class ReservationsController < ApplicationController
  def new

  end

  def create
    days = (session[:end].to_date - session[:start].to_date).to_i
    space = Space.find(params[:space_id])
    cost = space.price * days

    reservation = Reservation.new(start: session[:start], end: session[:end], space: space, user: current_user, total_cost: cost)
    reservation.save

    redirect_to profile_path(current_user.profile.id)
  end
end
