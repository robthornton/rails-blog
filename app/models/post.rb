# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to(:user)
  has_many(:comments, dependent: :destroy)
  has_and_belongs_to_many(:tags)

  validates(:body, presence: true)
  validates(:title, presence: true)

  # Helper that returns a space separated string of tags on a post. Used by
  # forms.
  def tag_names
    if tags.loaded?
      tags.map(&:name).sort
    else
      tags.order(:name).pluck(:name)
    end.join(' ')
  end

  # Helper that takes a space separated list of tags and attaches them
  # to a post. Used by forms.
  def tag_names=(joined_names)
    names = joined_names.downcase.split

    tags.clear

    names.each do |name|
      tags << Tag.find_or_create_by!(name: name)
    end
  end
end
