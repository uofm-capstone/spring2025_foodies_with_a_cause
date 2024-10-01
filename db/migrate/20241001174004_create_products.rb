class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :amount
      t.string :marketer
      t.date :expiration
      t.string :hold

      t.timestamps
    end
  end
end
