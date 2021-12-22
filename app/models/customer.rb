class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contacts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :review_likes, dependent: :destroy
  has_many :review_comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  validates :encrypted_password, presence: true
end
