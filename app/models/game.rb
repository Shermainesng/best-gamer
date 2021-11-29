class Game < ApplicationRecord
  has_many :coach_games

  validates :name, presence: true
end
