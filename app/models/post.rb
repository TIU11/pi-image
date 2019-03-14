class Post < ApplicationRecord
  has_one_attached :image

  validates :content, presence: true

  scope :sorted, -> { order(updated_at: :desc) }
end
