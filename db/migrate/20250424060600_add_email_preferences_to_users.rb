class AddEmailPreferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :instant_email, :boolean, default: false
    add_column :users, :summary_email, :boolean, default: false
  end
end
