require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create user' do
    user = User.create(name: 'Test User', email: 'test.user@example.com', password: '1234')
    assert(user.save)
  end

  test 'create prevents duplicate user' do
    assert_not(users(:jane).dup.save)
  end
end
