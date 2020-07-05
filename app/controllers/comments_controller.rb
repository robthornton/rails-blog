# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    head(:ok)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
