class User < ApplicationRecord
  has_many_attached :images
  has_one_attached :avatar

  validates :username, uniqueness: { case_sensitive: false }
end
