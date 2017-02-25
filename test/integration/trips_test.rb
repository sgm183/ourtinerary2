require 'test_helper'

class TripsTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(name: "Steve", email: "steve@email.com")
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
    assert_match @trip.name, response.body
    assert_match @trip2.name, response.body
  end


end
