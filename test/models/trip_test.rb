require 'test_helper'


class TripTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: "Steve", email: "steve@email.com")
    @trip = @user.trips.build(name: "Korea Trip", destination: "Seoul, Korea")
  end

  test "trip should be valid" do
    assert @trip.valid?
  end

  test "name should be present" do
    @trip.name = " "
    assert_not @trip.valid?
  end

  test "destination should be present" do
    @trip.destination = " "
    assert_not @trip.valid?
  end

  test "destination shouldn't be less than 5 characters" do
    @trip.destination = "a" * 3
    assert_not @trip.valid?
  end

  test "destination shouldn't be more than 500 characters" do
    @trip.destination = "a" * 501
    assert_not @trip.valid?
  end

  test "trip without user should be invalid" do
    @trip.user_id = nil
    assert_not @trip.valid?
  end


end
