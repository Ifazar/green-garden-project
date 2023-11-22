class Garden < ApplicationRecord
  # has_many :reservations
  # belongs_to :user

  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :detail, presence: true
  validates :price, presence: true

end
