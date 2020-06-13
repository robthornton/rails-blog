# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'create comment' do
    comment = Comment.create!(params)

    assert(comment)
    assert_equal(params[:body], comment.body)
    assert_equal(params[:user], comment.user)
  end

  private

  def params
    { body: 'Body',post: posts(:post_one), user: users(:jane) }
  end
end
