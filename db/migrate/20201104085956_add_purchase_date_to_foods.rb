class AddPurchaseDateToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :start_time, :date
  end
end
