class Garden < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :detail, presence: true
  validates :price, presence: true

end
