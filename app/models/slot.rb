class Slot < ApplicationRecord
  belongs_to :user
  has_one :order, dependent: :destroy

  scope :available, -> { where(booked: false) }
  scope :by_user, ->(user) { where('user_id= ?', user) }

end
