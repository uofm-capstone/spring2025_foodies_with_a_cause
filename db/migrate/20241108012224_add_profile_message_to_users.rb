class AddProfileMessageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_message, :text
  end
end
