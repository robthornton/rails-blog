class Tag < ApplicationRecord
  has_and_belongs_to_many(:post)

  validates(:name, presence: true, uniqueness: { case_sensitive: false })
end
