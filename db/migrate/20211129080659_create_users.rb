class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :country
      t.boolean :skype_discord
      t.string :profile_pic
      t.boolean :receive_email
      t.boolean :on_vacation

      t.timestamps
    end
  end
end
