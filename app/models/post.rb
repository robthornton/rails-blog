# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to(:user)
  has_many(:comments, dependent: :destroy)
  has_and_belongs_to_many(:tags)

  validates(:body, presence: true)
  validates(:title, presence: true)

  def tag_names
    if tags.loaded?
      tags.map(&:name).sort
    else
      tags.order(:name).pluck(:name)
    end.join(' ')
  end

  def tag_names=(joined_names)
    names = joined_names.split

    # Remove tags which no longer appear
    tags.where.not(name: names).destroy_all!
    # Might need to call something like
    #   tags.delete(*tags.where.not(name: names))

    # Add tags which aren't already associated
    (names - tag_names).each do |name|
      tag = Tag.find_or_create_by!(name: name)

      tags << tag
    end
  end
end
