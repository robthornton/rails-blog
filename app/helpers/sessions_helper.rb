# frozen_string_literal: true

module SessionsHelper

  def logged_in?
    puts "current user: #{current_user}"
    puts "session email: #{session[:email]}"
    !@current_user.nil?
  end

  def current_user
    @current_user = nil unless session[:email]
    @current_user ||= User.find_by(email: session[:email])
  end
end
