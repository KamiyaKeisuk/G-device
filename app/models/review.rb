class Review < ApplicationRecord
  attachment :image

  has_many :review_likes, dependent: :destroy
  # 未完成 いいね順に伴っての記述
  # has_many :liked_customers, through: :review_likes, source: :customer
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

   # 未完成 並び替え機能
  # def self.sort(selection)
    # case selection
    # when 'likes'
      # return includes(:liked_customers).sort {|a,b| b.liked_customers.size <=> a.liked_customers.size}
    # when 'new'
      # return all.order(created_at: :desc)
    # end
  # end
end
