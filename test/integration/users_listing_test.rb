require 'test_helper'

class UsersListingTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(name: "Steve", email: "steve@email.com",
                         password: "password", password_confirmation: "password")
    @user2 = User.create!(name: "Steve2", email: "steve2@email.com",
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

  test "should delete user" do
    get users_path
    assert_template 'users/index'
    assert_difference 'User.count', -1 do
      delete user_path(@user2)
    end
    assert_redirected_to users_path
    assert_not flash.empty?
  end

  test "should get users show" do
    get user_path(@user)
    assert_template 'users/show'
    assert_match @user.name, response.body
  end

end
