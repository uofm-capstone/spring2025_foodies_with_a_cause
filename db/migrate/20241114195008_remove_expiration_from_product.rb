class RemoveExpirationFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :expiration, :string
  end
end
