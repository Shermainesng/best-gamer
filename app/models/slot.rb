class Slot < ApplicationRecord
  belongs_to :user
  has_one :order, dependent: :destroy

  scope :available, -> { where(booked: false) }
  scope :by_user, ->(user) { where('user_id = ?', user) }
  scope :by_date, ->(date) { where('date = ?', date) }

  def duration
    (self.end - self.start)/(60*60)
  end

end
