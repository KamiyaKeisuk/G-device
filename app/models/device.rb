class Device < ApplicationRecord
  attachment :image

  has_many :reviews, dependent: :destroy
  belongs_to :category
  belongs_to :maker

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  # レビューの平均点
  def average_rate
    if reviews.empty?
      0.0
    else
      reviews.average(:rate).round(1)
    end
  end

  # 新着順、登録順に並び替え
  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :desc)
    when 'old'
      return all.order(created_at: :asc)
    end
  end
end
