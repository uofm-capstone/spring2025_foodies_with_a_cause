class FixPaymentAmountColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :paymount_amount, :payment_amount
  end
end
