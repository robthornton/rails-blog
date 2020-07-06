# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    post = Post.find_by(comment_params[:post_id])

    Comment.create!(comment_params)

    redirect_to(post, notice: 'Comment added')
  rescue ActiveRecord::RecordInvalid
    redirect_to(post, alert: 'Body can not be empty')
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
