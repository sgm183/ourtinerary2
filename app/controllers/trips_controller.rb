class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = User.first
    if @trip.save
      flash[:success] = "Trip was created successfully!"
      redirect_to trip_path(@trip)
    else
      render 'new'
    end

  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      flash[:success] = "Trip was updated!"
      redirect_to trip_path(@trip)
    else
      render 'edit'
    end
  end


  private

  def trip_params
    params.require(:trip).permit(:name, :destination)
  end

end
