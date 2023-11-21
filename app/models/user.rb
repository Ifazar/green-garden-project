class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :gardens
  has_many :reservations, through: :gardens
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
