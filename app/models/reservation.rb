class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :garden

  # validates :date, presence: true

end
