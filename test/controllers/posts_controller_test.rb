require 'test_helper'

class BlogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get(posts_path)
    assert_response(:success)
  end

end
