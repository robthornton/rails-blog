# frozen_string_literal: true

require 'test_helper'
require 'securerandom'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'get signup is successful' do
    get(signup_path)
    assert_response(:success)
  end

  test 'post to signup redirects to login' do
    post(users_path, params: new_user_params)

    assert_redirected_to(login_path)
  end

  test "post to signup redirects to login when passwords don't match" do
    params = new_user_params
    params[:user].merge!({
      password: 'password',
      password_confirmation: 'drowssap',
    })
    post(users_path, params: params)

    assert_redirected_to(signup_path)
  end

  test 'post to signup redirects to signup with existing user' do
    user = users(:jane)

    params = new_user_params
    params[:user] = {
      name: user.name,
      email: user.email,
      password: 'jane.doe.password',
      password_confirmation: 'jane.doe.password',
    }
    post(users_path, params: params)

    assert_redirected_to(signup_path)
  end

  private

  def new_user_params
    {
      user: {
        name: random_string,
        email: "#{random_string}@#{random_string}.com",
        password: 'password',
        password_confirmation: 'password',
      }
    }
  end

  def random_string
    SecureRandom.alphanumeric(8)
  end
end
