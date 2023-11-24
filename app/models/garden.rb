# frozen_string_literal: true

class Garden < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user

  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :detail, presence: true
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
