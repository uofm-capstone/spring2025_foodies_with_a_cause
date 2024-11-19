class RemoveHoldFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :hold, :string
  end
end
