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

  private

  def params
    {
      body: 'Body',
      user: users(:jane),
    }
  end
end
