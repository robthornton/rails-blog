# frozen_string_literal: true

module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user = nil unless session[:email]
    @current_user ||= User.find_by(email: session[:email])
  end
end
