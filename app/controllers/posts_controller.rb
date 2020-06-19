# frozen_string_literal: true

class PostsController < ApplicationController
  before_action(:require_login, only: [:new, :create, :edit, :update])
  before_action(:find_post, only: [:destroy, :edit, :show, :update])

  def create
    post = Post.new(post_params.merge({ user: current_user}))

    unless post.save
      post.errors.each do |k, err|
        Rails.logger.error("Error: #{k}: #{err}")
      end

      flash[:error] = 'Failed to create post'
      redirect_to(post_new_path)

      return
    end

    flash[:notice] = "New post '#{post.title}' created successfully!"
    redirect_to(root_path)
  end

  def destroy
    @post.destroy!
    redirect_to(root_path, notice: "'#{post.title}' deleted")
  end

  def edit
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
    @post.update(post_params)
    redirect_to(@post, notice: "'#{@post.title}' updated")
  end

  private

  def find_post
    @post = current_user.posts.find(params.require(:id))
    # Unless you have some sort of admin logic where they can edit other posts, in which case, you do something like
    #   posts = current_user.admin? ? Post.all : current_user.posts
    #   @post = posts.find(params.require(:id))
  end

  def post_params
    # params are already logged, I think
    params.require(:post).permit(:body, :tag_names, :title)
  end

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to create a new blog post'
      redirect_to(login_url)
    end
  end

  # I believe there is a way to consolidate your view helpers and controller helpers. You may explicitly have to say
  # something like
  #   helper :users
  # to access them from the controller. Not sure.
  def logged_in?
    # Does just having an email in your session mean you're logged in?
    # What if you can't fine the user?
    current_user.present?
  end
end
