class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coach_games

  validates :email, presence: true, uniqueness: true, format: { with: /^[^@\s]+@[^@\s]+\.[^@\s]+$/ }
  validates :password, presence: true
  validates :username, uniqueness: true
  validates :rates, numericality: true
  validates :coach_since, format: { with: /(19|20)\d{2}/ }
end
