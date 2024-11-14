class AddHoldToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :hold, :string
  end
end
