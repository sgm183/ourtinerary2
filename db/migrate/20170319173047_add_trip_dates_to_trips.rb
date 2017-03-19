class AddTripDatesToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :start_date, :date
    add_column :trips, :end_date, :date
  end
end
