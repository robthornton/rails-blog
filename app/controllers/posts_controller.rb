# frozen_string_literal: true

class PostsController < ApplicationController
  before_action(:require_login, only: [:new, :create])
  before_action(:find_post, only: [:destroy, :edit, :show, :update])

  def create
    post = Post.create(post_params.merge({ user: current_user}))

    unless post.errors.empty?
      post.errors.each do |k, err|
        puts("Error: #{k}: #{err}")
      end

      flash[:error] = 'Failed to create post'
      redirect_to(post_new_path)

      return
    end

    update_tags(post: post)

    flash[:notice] = "New post '#{post.title}' created successfully!"
    redirect_to(root_path)
  end

  def destroy
    @post.destroy
    redirect_to(root_path, notice: "'#{post.title}' deleted")
  end

  def edit
    @tags = @post.tags.map(&:name).join(' ')
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show; end

  def update
    # @post.tags.clear
    # update_tags(post: @post)

    @post.update(post_params)
    redirect_to(@post, notice: "'#{@post.title}' updated")
  end

  private

  def find_post
    @post = Post.find(id)
  end

  def id
    params[:id]
  end

  def post_params
    puts("params: #{params}")
    params.require(:post).permit(:body, :tag_names, :title)
  end

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to create a new blog post'
      redirect_to(login_url)
    end
  end

  # def update_tags(post:)
  #   tags = post_params[:tags]

  #   tags&.split&.each do |tag|
  #     post.tags.find_or_create_by(name: tag)
  #   end
  # end

  def logged_in?
    !email.nil?
  end
end
