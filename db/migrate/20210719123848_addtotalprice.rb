class Addtotalprice < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :total_price, :float
  end
end
