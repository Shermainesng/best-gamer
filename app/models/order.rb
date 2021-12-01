class Order < ApplicationRecord
  belongs_to :slot
  belongs_to :user

  monetize :paid_amount_cents
end
