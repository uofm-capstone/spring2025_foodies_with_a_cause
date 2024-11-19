class RemoveNameFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :name, :string
  end
end
