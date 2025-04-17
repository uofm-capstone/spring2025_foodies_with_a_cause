class AddSummaryEmailTimeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :summary_email_time, :string
  end
end
