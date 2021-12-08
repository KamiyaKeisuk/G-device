class Review < ApplicationRecord
  has_many :review_likes, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  belongs_to :customer
  belongs_to :device

  validates :title, presence: true
  validates :comment, presence: true
  validates :rate, presence: true
end
