class RemoveDurationFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :duration, :integer
  end
end
