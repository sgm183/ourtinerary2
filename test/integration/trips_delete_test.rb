require 'test_helper'

class TripsDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(name: "Steve", email: "steve@email.com",
                         password: "password", password_confirmation: "password")
    @trip = Trip.create(name: "Visit Parents", destination: "California", user: @user)
  end

  test "successfully delete a trip" do
    sign_in_as(@user, "password")
    get trip_path(@trip)
    assert_template 'trip/show'
    assert_select 'a[href=?]', trip_path(@trip), text: "Delete this trip"
    assert_difference 'Trip.count', -1 do
      delete trip_path(@trip)
    end
    assert_redirected_to trips_path
    assert_not flash.empty?
  end
end
