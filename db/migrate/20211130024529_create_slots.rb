class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.boolean :status
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
