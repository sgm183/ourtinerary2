class AddNumOfTravelersToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :num_of_travelers, :integer
  end
end
