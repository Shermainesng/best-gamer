class Game < ApplicationRecord
  has_many :coach_games, dependent: :destroy
  has_many :users, through: :coach_games

  validates :name, presence: true
end
