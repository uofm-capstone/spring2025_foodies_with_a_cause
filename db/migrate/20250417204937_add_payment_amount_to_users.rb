class AddPaymentAmountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :paymount_amount, :integer
  end
end
