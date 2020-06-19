# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'create comment' do
    comment = Comment.create!(params)

    # You're kinda just testing Rails at this point

    refute_nil(comment)
    assert_equal(params[:body], comment.body)
    assert_equal(params[:user], comment.user)
  end

  private

  def params
    { body: 'Body', post: posts(:post_one), user: users(:jane) }
  end
end
