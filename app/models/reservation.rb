class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :garden
  
  validates :date, presence: true
  # validates :user_id, presence: true, if: :same_user?
  # def same_user?
  #   :user_id != :garden_id_user_id
  # end

end
