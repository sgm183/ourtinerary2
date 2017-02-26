require 'test_helper'

class TripsTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(name: "Steve", email: "steve@email.com",
                         password: "password", password_confirmation: "password")

    @trip = Trip.create(name: "Visit Parents", destination: "California", user: @user)
    @trip2 = @user.trips.build(name: "Visit Korea", destination: "Seoul, Korea")
    @trip2.save

  end

  test "should get trips index" do
    get trips_url
    assert_response :success

  end

  test "should get trips listing" do
    get trips_path
    assert_template 'trips/index'
    assert_select "a[href=?]", trip_path(@trip), text: @trip.name
    assert_select "a[href=?]", trip_path(@trip2), text: @trip2.name

  end

  test "should get trips show" do
    get trip_path(@trip)
    assert_template 'trips/show'
    assert_match @trip.name, response.body
    assert_match @trip.destination, response.body
    assert_match @user.name, response.body
    assert_select 'a[href=?]', edit_trip_path(@trip), text: "Edit this trip"
    assert_select 'a[href=?]', trip_path(@trip), text: "Delete this trip"
    assert_select 'a[href=?]', trips_path, text: "Return to trips"
  end

  test "create new valid trip" do
    get new_trip_path
    assert_template 'trips/new'
    name_of_trip = "Visit LA"
    destination_of_trip = "Los Angeles"
    assert_difference 'Trip.count', 1 do
      post trips_path, params: { trip: { name: name_of_trip, destination: destination_of_trip} }
    end
    follow_redirect!
    assert_match name_of_trip.capitalize, response.body
    assert_match destination_of_trip, response.body

  end

  test "reject invalid trip submissions" do
    get new_trip_path
    assert_template 'trips/new'
    assert_no_difference 'Trip.count' do
      post trips_path, params: { trip: { name: " ", destination: " "} }
    end
    assert_template 'trips/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end
