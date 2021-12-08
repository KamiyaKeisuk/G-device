class Contact < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :email, presence: true
  validates :title, presence: true
  validates :message, presence: true
end
