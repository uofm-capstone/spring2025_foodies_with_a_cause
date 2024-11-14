class AddTypeOfFoodToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :food_type, :string
  end
end
