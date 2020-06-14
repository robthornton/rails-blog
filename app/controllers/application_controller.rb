# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user ||= email && User.find_by(email: email)
  end

  def email
    session[:email]
  end
end
