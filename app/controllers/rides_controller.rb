class RidesController < ApplicationController
  before_action :require_login

  def create
    @attraction = Attraction.find(params[:attraction_id])
    @ride = @attraction.rides.new
    @ride.user = current_user
    @ride.save
    @ride.take_ride
    redirect_to @ride.user
  end

  private
    def require_login
      redirect_to root_url unless current_user
    end
end
