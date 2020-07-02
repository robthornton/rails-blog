# frozen_string_literal: true

class User < ApplicationRecord
  has_many(:posts)

  has_secure_password

  validates(:name, presence: true)
  validates(:email, presence: true, uniqueness: { case_sensitive: false })

  attr_accessor(:password_confirmation)
end
