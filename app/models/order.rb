class Order < ApplicationRecord
  belongs_to :slot
  belongs_to :user
  has_one :review, dependent: :destroy

  monetize :paid_amount_cents
end
