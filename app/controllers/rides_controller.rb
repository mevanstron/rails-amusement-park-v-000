class RidesController < ApplicationController

  def create
    @ride = Ride.new(attraction: Attraction.find_by(id: params[:attraction][:id]), user: current_user)

    flash[:notice] = @ride.take_ride

    redirect_to user_path(current_user)
  end
end
