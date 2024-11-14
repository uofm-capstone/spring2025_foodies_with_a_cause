class RemoveAmountFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :amount, :string
  end
end
