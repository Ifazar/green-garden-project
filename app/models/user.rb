# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :gardens
  has_many :reservations, through: :gardens



  # validates :email, presence: true, uniqueness: true
  # validates :first_name, presence: true

  # validates :address, presence: true
  # validates :phone_number, presence: true
end
