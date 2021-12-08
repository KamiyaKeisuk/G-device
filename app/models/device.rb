class Device < ApplicationRecord
  attachment:image

  has_many :reviews, dependent: :destroy
  belongs_to :category
  belongs_to :maker

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
