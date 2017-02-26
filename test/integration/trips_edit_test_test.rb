require 'test_helper'

class TripsEditTestTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(name: "Steve", email: "steve@email.com",
                         password: "password", password_confirmation: "password")
    @trip = Trip.create(name: "Visit Parents", destination: "California", user: @user)
  end

  test "reject invalid trip update" do
    get edit_trip_path(@trip)
    assert_template 'trips/edit'
    patch trip_path(@trip), params: { trip: { name: " ", destination: "some destination"} }
    assert_template 'trips/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "successfully edit a trip" do
    get edit_trip_path(@trip)
    assert_template 'trips/edit'
    updated_name = "updated trip name"
    updated_destination = "updated destination"
    patch trip_path(@trip), params: { trip: { name: updated_name, destination: updated_destination} }
    assert_redirected_to @trip
    assert_not flash.empty?
    @trip.reload
    assert_match updated_name, @trip.name
    assert_match updated_destination, @trip.destination
  end

end
