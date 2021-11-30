class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coach_games, dependent: :destroy
  has_many :games, through: :coach_games
  has_many :slots
  has_many :orders

  validates :email, presence: true, uniqueness: true, format: { with: /\w+(\.\w+)?@\w+.\w{2,3}/ }
  validates :password, presence: true
  validates :username, uniqueness: true
  validates :rates, numericality: true, allow_nil: true

  scope :filter_username, -> given_username { where(username: given_username) }
  scope :filter_country, -> given_country { where(country: given_country) }
  scope :filter_price, -> min_price, max_price { where("rates >= ? AND rates <= ?", min_price, max_price) }
  scope :filter_game, -> (given_game) { joins(:games).where(games: {name: given_game}) }

end
