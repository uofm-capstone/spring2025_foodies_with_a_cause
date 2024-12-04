class CreateUserNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :user_notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true
      t.boolean :read, default: false, null: false

      t.timestamps
    end
  end
end
