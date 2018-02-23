class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]
  def show
    @ride = Ride.new
    @user = current_user
  end

  def update
    
  end

  def edit
  end

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to @attraction
    else
      render :new
    end
  end

  private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
