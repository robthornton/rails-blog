# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: login_params[:email])

    unless user.authenticate(login_params[:password])
      redirect_to(login_path, flash: { error: 'Email or password is incorrect' })
      return
    end

    session[:email] = user.email
    redirect_to(root_path, flash: { notice: 'Login successful!' })
  end

  def destroy
    session[:email] = nil
    redirect_to(root_path, flash: { notice: 'Logout successful!' })
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
