class AddTimeToSlots < ActiveRecord::Migration[6.1]
  def change
    add_column :slots, :start, :time
    add_column :slots, :end, :time
  end
end
