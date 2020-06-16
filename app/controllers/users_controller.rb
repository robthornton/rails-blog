# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    user = User.create(user_params)

    unless user.valid?
      # TODO: Properly log errors
      user.errors.each do |key, msg|
        Rails.logger.info("#{key}: #{msg} #{user_params[:email]}")
      end

      redirect_to(signup_path, flash: { error: 'Sign up failed!' })
      return
    end

    redirect_to(login_path, flash: { notice: 'New sign-up successful!' })
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
