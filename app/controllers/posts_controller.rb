# frozen_string_literal: true

class PostsController < ApplicationController
  before_action(:require_login, only: [:new])

  def index
  end

  def new
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to create a new blog post'
      redirect_to(login_url)
    end
  end

  def logged_in?
    !session[:user_id].nil?
  end
end
