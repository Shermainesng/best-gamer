class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :skype_discord, :string
    add_column :users, :profile_picture, :string
    add_column :users, :receive_email, :boolean
    add_column :users, :on_vacation, :boolean
    add_column :users, :rates, :integer
    add_column :users, :coach_since, :date
    add_column :users, :profile_content, :text
  end
end
