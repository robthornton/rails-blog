# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'create post' do
    post = Post.create!(params)

    assert_equal(params[:user], post.user)
    assert_equal(params[:body], post.body)

    post.tags.each_with_index do |i, tag|
      assert_equal(params[:tags][i], tag)
    end
  end

  test 'post with tags' do
    post = posts(:post_one)

    post.tags.create!(name: 'tag0')
    post.tags.create!(name: 'tag1')

    assert_equal(2, post.tags.count)
  end

  test 'post with comments' do
    post = posts(:post_one)

    post.comments << comments(:comment_jane)
    post.comments << comments(:comment_john)

    assert_equal(2, post.comments.count)
  end

  private

  def params
    {
      body: 'Body',
      user: users(:jane),
    }
  end
end
