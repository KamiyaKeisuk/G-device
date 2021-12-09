class Device < ApplicationRecord
  attachment:image

  has_many :reviews, dependent: :destroy
  belongs_to :category
  belongs_to :maker

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

#レビューの平均点
  def average_rate
    unless self.reviews.empty?
      reviews.average(:rate).round(1)
    else
      0.0
    end
  end
end
