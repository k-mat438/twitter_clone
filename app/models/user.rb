# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # validates :name, presence: true,
  # validates :email, presence: true,
  validates :name, presence: true, length: { maximum: 10 }
  validates :phone_number, presence: true, uniqueness: true
  validates :birth, presence: true
  # validates :password, presence: true,
end
