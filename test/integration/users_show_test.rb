require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(name: "Steve", email: "steve@email.com",
                         password: "password", password_confirmation: "password")

    @trip = Trip.create(name: "Visit Parents", destination: "California", user: @user)
    @trip2 = @user.trips.build(name: "Visit Korea", destination: "Seoul, Korea")
    @trip2.save
  end

  test "should get users show" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select "a[href=?]", trip_path(@trip), text: @trip.name
    assert_select "a[href=?]", trip_path(@trip2), text: @trip2.name
    assert_match @trip.destination, response.body
    assert_match @trip2.destination, response.body
    assert_match @user.name, response.body
  end

end
