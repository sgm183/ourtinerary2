require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "should get signup path" do
    get signup_path
    assert_response :success
  end

  test "should reject invalid signup" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: " ", email: " ", password: "password",
                                         password_confirmation: " "} }
    end
    assert_template 'user/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "should accept valid signup" do
    get signup_path
    assert_difference "User.count, 1" do
      post users_path, params: { user: { name: "Inigo", email: "inigo@email.com", password: "password",
                                         password_confirmation: "password"} }
    end
    follow_redirect!
    assert_template 'user/show'
    assert_not flash.empty?
  end
end
