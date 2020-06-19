# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user ||= email && User.find_by!(email: email) # Should the session be able to contain an email for a user that can't be found?
  end

  def email
    session[:email]
  end
end
