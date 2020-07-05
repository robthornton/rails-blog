# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test '#create successful' do
    comment = Comment.create!(params)

    assert(comment)
    assert_equal(params[:body], comment.body)
    assert_equal(params[:user], comment.user)
  end

  test '#create with empty body raises' do
    assert_raises 'ArgumentError' do
      Comment.create!(params.delete(:body))
    end
  end

  test '#create with empty post raises' do
    assert_raises 'ArgumentError' do
      Comment.create!(params.delete(:post))
    end
  end

  private

  def params
    { body: 'Body', post: posts(:post_one), user: users(:jane) }
  end
end
