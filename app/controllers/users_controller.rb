# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    if user_params[:password] != user_params[:password_confirmation]
      redirect_to(signup_path, flash: { error: 'Passwords do not match!' })
      return
    end

    user = User.create(user_params.except(:password_confirmation))
    unless user.valid?
      # TODO Properly log errors
      user.errors.each do |key, msg|
        puts "#{key}: #{msg} #{user_params[:email]}"
      end

      redirect_to(signup_path, flash: { error: 'Sign up failed!' })
      return
    end

    redirect_to(login_path, flash: { notice: 'New sign-up successful!' })
  end

  def new
  end

  private

  def user_params
    params.except(:authenticity_token, :commit).permit(:name, :email, :password, :password_confirmation)
  end
end
