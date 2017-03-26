class TripitemsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @tripitem = @trip.tripitems.create(tripitem_params)
    redirect_to trip_path(@trip)
  end

  private
  def tripitem_params
    params.require(:tripitem).permit(:name, :itemtype, :date, :cost, :location, :pocname, :pocphone)
  end
end
