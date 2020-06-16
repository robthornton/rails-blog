# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to(:user)
  has_many(:comments, dependent: :destroy)
  has_and_belongs_to_many(:tags)

  validates(:body, presence: true)
  validates(:title, presence: true)
end
