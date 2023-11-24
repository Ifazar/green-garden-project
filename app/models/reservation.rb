# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :garden

  validates :date, presence: true
end
