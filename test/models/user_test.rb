require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create user' do
    user = User.create(name: 'Test User', email: 'test.user@example.com', password: '1234')
    assert(user.save)
  end

  test 'create prevents duplicate user' do
    existing_user = users(:jane)
    user = User.create(name: existing_user.name, email: existing_user.email, password: existing_user.password)
    assert_not(user.save)
  end
end
