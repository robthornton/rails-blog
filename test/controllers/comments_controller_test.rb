# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'post comment successful' do
    post(comments_url, params: comment_params)

    assert_response(:success)
  end

  test 'post comment without post fails' do
    assert_raises 'ArgumentError' do
      post(comments_url, params: {})
    end
  end

  private

  def comment_params
    {
      comment: {
        body: 'Comment body',
        post_id: posts(:post_one).id,
        user_id: users(:jane).id,
      }
    }
  end
end
