class ChangeRatesType < ActiveRecord::Migration[6.1]
  def change
    add_monetize :orders, :paid_amount, currency: { present: false }
  end
end
