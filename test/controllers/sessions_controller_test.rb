# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'login' do
    get(login_path)
    assert_response(:success)
  end

  test 'new session' do
    user = users(:jane)
    params = { email: user.email, password: 'jane.doe.password' }
    post(login_path, params: params)

    assert_redirected_to(root_path)
  end

  test 'new session with bad password fails to set session' do
    user = users(:jane)
    params = { email: user.email, password: 'bad_password' }
    post(login_path, params: params)

    assert_redirected_to(login_path)
  end
end
