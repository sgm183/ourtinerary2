class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @trips = Trip.paginate(page: params[:page], per_page: 3)
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      flash[:success] = "Trip was created successfully!"
      redirect_to trip_path(@trip)
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      flash[:success] = "Trip was updated!"
      redirect_to trip_path(@trip)
    else
      render 'edit'
    end
  end

  def destroy
    Trip.find(params[:id]).destroy
    flash[:success] = "Trip deleted Successfully"
    redirect_to trips_path

  end



  private

  def set_trip
    @trip = Trip.find(params[:id])
  end


  def trip_params
    params.require(:trip).permit(:name, :destination, :start_date, :end_date, :num_of_travelers)
  end

  def require_same_user
    if current_user != @trip.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own trips"
      redirect_to trips_path
    end
  end


end
