# frozen_string_literal: true

class PostController < ApplicationController
  before_action(:require_login, only: [:new, :create])

  def new
    @post = Post.new
  end

  def create
    post = Post.create({
      body: post_params[:body],
      user: current_user,
    })

    unless post.errors.empty?
      post.errors.each do |k, err|
        puts("Error: #{k}: #{err}")
      end

      flash[:error] = 'Failed to create post'
      redirect_to(post_new_path)

      return
    end

    flash[:notice] = 'New post created successfully!'
    redirect_to(post)
  end

  def destroy
    Post.destroy(id)
    redirect_to(root_path, notice: "Post #{id} deleted")
  end

  def edit
    @post = Post.find(id)
  end

  def update
    post = Post.find(id)
    post.update(post_params)
    redirect_to(root_path, notice: "Post #{id} updated")
  end

  private

  def id
    params[:id]
  end

  def post_params
    params.require(:post).permit(:body)
  end

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to create a new blog post'
      redirect_to(login_url)
    end
  end

  def logged_in?
    !email.nil?
  end
end
