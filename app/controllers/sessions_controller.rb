# frozen_string_literal: true

class SessionsController < ApplicationController
  def login
  end

  def new
    user = User.find_by(email: login_params[:email])

    unless user.authenticate(login_params[:password])
      redirect_to(login_path, flash: { error: 'Email or password is incorrect' })
      return
    end

    session[:email] = user.email
    redirect_to(signup_path, flash: { notice: 'Login successful!' })
  end

  def delete
    session[:email] = nil
    reset_session
    redirect_to(signup_path, flash: { notice: 'Logout successful!' })
  end

  private

  def login_params
    params.except(:commit, :authenticity_token).permit(:email, :password)
  end
end