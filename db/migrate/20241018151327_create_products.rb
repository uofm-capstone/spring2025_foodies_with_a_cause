class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :amount
      t.date :expiration
      t.string :hold
      t.string :marketer
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
