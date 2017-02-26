require 'test_helper'

class UsersListingTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(name: "Steve", email: "steve@email.com",
                         password: "password", password_confirmation: "password")

  end

  test "should get users index" do
    get users_url
    assert_response :success

  end

  test "should get users listing" do
    get users_path
    assert_template 'users/index'

  end

  test "should get users show" do
    get user_path(@user)
    assert_template 'users/show'
    assert_match @user.name, response.body
  end

end
