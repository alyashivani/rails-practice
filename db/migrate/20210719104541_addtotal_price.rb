class AddtotalPrice < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :total_price, :float
  end
end
