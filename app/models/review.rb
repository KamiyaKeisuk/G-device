class Review < ApplicationRecord
  attachment :image

  has_many :review_likes, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  belongs_to :customer
  belongs_to :device

  def review_liked_by?(customer)
    review_likes.where(customer_id: customer.id).exists?
  end

  validates :title, presence: true
  validates :comment, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true
end
