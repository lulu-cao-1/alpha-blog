require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
  test "get create user form and create user" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "sports", email: "ex@ex.com", password: "1234" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "sports", response.body
  end

  test "get create user form and reject invalid user" do
    get "/signup"
    assert_response :success
    assert_no_difference 'User.count' do
      post users_path, params: { user: { username: "sports", email: "ex@ex.com" } }
    end
    assert_match "errors", response.body
  end
end
